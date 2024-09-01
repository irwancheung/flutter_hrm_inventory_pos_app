import 'package:flutter/material.dart';

import '../assets/assets.dart';
import '../constants/colors.dart';
import 'components.dart';

class EmptyPlaceholder2 extends StatelessWidget {
  const EmptyPlaceholder2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.icons.alert.empty.image(width: 65.0),
        const SpaceHeight(24.0),
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
