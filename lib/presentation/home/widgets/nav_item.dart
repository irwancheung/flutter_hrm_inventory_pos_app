import 'package:flutter/material.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavItem extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.label,
    required this.iconPath,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(14.0)),
      child: Container(
        width: 250.0,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: isActive ? AppColors.primary : Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.white : AppColors.gray,
                BlendMode.srcIn,
              ),
            ),
            const SpaceWidth(12.0),
            Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.white : AppColors.gray,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
