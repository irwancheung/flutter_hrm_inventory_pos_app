import 'package:flutter/material.dart';
import 'package:flutter_hrm_inventory_pos_app/core/assets/assets.dart';
import 'package:flutter_hrm_inventory_pos_app/core/components/components.dart';
import 'package:flutter_hrm_inventory_pos_app/core/constants/colors.dart';

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
