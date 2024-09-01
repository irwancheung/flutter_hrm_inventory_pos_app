import 'package:flutter/material.dart';
import 'package:flutter_hrm_inventory_pos_app/core/assets/assets.dart';
import 'package:flutter_hrm_inventory_pos_app/core/components/components.dart';
import 'package:flutter_hrm_inventory_pos_app/core/constants/colors.dart';

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
