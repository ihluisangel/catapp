import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class LevelPointWidget extends StatelessWidget {
  final int max;
  final int current;
  const LevelPointWidget({Key? key, required this.current, required this.max})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var i = 1; i <= max; i++)
          Icon(
            Icons.circle,
            size: 10,
            color: i <= (current) ? AppColors.tercero : AppColors.grey2,
          )
      ],
    );
  }
}
