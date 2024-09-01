import 'package:flutter/material.dart';

import '../assets/assets.dart';
import '../constants/colors.dart';
import 'components.dart';

class EmptyPlaceholder extends StatelessWidget {
  const EmptyPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.icons.alert.empty.image(width: 65.0),
        const SpaceWidth(24.0),
        const Text(
          'No Data',
          style: TextStyle(
            color: AppColors.gray,
          ),
        ),
      ],
    );
  }
}
