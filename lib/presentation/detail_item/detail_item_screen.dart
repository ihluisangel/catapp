import 'package:catapp/presentation/components/level_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

import '../../theme/app_color.dart';
import 'detail_item_controller.dart';

class DetailItemScreen extends GetWidget<DetailItemController> {
  DetailItemScreen({
    Key? key,
  }) : super(key: key) {
    Get.put(DetailItemController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.item.name ?? ''),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: OptimizedCacheImage(
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  imageUrl: controller.item.image?.url ?? '',
                  placeholder: (context, url) => Image.asset(
                    'assets/img/loading.gif',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  //errorWidget: (context, url, error) => Icon(Icons.error),
                  errorWidget: (context, url, error) => const Image(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/img/nodisponible.png"),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        controller.item.description ?? '',
                        style: const TextStyle(height: 1.4),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildFeatureText(
                          icon: Icons.public,
                          title: "Country of origin:",
                          text: controller.item.origin ?? ''),
                      _buildFeatureLevel(
                          icon: Icons.psychology,
                          title: "Intelligence:",
                          level: controller.item.intelligence ?? 0),
                      _buildFeatureLevel(
                          icon: Icons.group_work,
                          title: "Adaptability:",
                          level: controller.item.adaptability ?? 0),
                      _buildFeatureText(
                          icon: Icons.favorite,
                          title: "Life span:",
                          text: "${controller.item.lifeSpan ?? '--'} years"),
                      _buildFeatureLevel(
                          icon: Icons.accessibility,
                          title: "Affection level:",
                          level: controller.item.affectionLevel ?? 0),
                      _buildFeatureLevel(
                          icon: Icons.child_care,
                          title: "Child friendly:",
                          level: controller.item.childFriendly ?? 0),
                      _buildFeatureLevel(
                          icon: Icons.bolt,
                          title: "Energy level:",
                          level: controller.item.energyLevel ?? 0),
                      _buildFeatureText(
                          icon: Icons.sentiment_satisfied,
                          title: "Temperament:",
                          text: controller.item.temperament ?? '--'),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  _buildFeatureText(
      {required IconData icon, required String title, required String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: [
                Icon(
                  icon,
                  size: 15,
                  color: AppColors.accent,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
              text,
              textAlign: TextAlign.end,
            )),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  _buildFeatureLevel(
      {required IconData icon, required String title, required int level}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: [
                Icon(
                  icon,
                  size: 15,
                  color: AppColors.accent,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            LevelPointWidget(current: level, max: 5)
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
