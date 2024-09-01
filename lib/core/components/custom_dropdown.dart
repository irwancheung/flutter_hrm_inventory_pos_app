import 'package:flutter/material.dart';
import 'package:flutter_hrm_inventory_pos_app/core/components/spaces.dart';
import 'package:flutter_hrm_inventory_pos_app/core/constants/colors.dart';

class CustomDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String label;
  final Function(String? value)? onChanged;
  final bool showLabel;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.label,
    this.onChanged,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel) ...[
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SpaceHeight(12.0),
        ],
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: AppColors.stroke),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: AppColors.stroke),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: AppColors.stroke),
            ),
            hintText: value ?? label,
          ),
        ),
      ],
    );
  }
}
