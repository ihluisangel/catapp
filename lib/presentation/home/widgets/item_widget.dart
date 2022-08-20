import 'package:catapp/model/cat.dart';
import 'package:catapp/presentation/components/level_point.dart';
import 'package:catapp/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class ItemWidget extends StatelessWidget {
  final Cat cat;

  final VoidCallback onPressMore;

  const ItemWidget({Key? key, required this.cat, required this.onPressMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  cat.name ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () {
                      onPressMore();
                    },
                    child: const Text("More...")),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: OptimizedCacheImage(
                  fit: BoxFit.cover,

                  imageUrl: cat.image?.url ?? '',
                  placeholder: (context, url) => Image.asset(
                    'assets/img/loading.gif',
                    //'assets/img/constructora.png',

                    fit: BoxFit.cover,
                  ),
                  //errorWidget: (context, url, error) => Icon(Icons.error),
                  errorWidget: (context, url, error) => const Image(
                    image: AssetImage("assets/img/nodisponible.png"),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.public,
                      size: 15,
                      color: AppColors.accent,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(cat.origin ?? ''),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.psychology,
                      size: 18,
                      color: AppColors.accent,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    LevelPointWidget(current: cat.intelligence ?? 0, max: 5)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
