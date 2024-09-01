import 'package:flutter/material.dart';

import 'package:flutter_hrm_inventory_pos_app/core/core.dart';

class CardCustom extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const CardCustom({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
              color,
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
              ),
            ),
            const SpaceHeight(4.0),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
