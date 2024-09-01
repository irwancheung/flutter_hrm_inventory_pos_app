import 'package:flutter/material.dart';

import '../core.dart';

class YesNoToggle extends StatefulWidget {
  final String label;
  final bool showLabel;
  final bool initialValue;
  final double borderRadius;
  final void Function(bool isYesSelected)? onChanged;

  const YesNoToggle({
    super.key,
    required this.label,
    this.showLabel = true,
    this.initialValue = false,
    this.borderRadius = 18.0,
    this.onChanged,
  });

  @override
  State<YesNoToggle> createState() => _YesNoToggleState();
}

class _YesNoToggleState extends State<YesNoToggle> {
  late bool isYesSelected;

  @override
  void initState() {
    super.initState();
    isYesSelected = widget.initialValue;
  }

  void _toggleSelection(bool value) {
    setState(() {
      isYesSelected = value;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(isYesSelected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabel) ...[
          Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12.0),
        ],
        Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.stroke),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOption(
                text: 'No',
                isSelected: !isYesSelected,
                isYesValue: false,
                onTap: () => _toggleSelection(false),
              ),
              _buildOption(
                text: 'Yes',
                isSelected: isYesSelected,
                isYesValue: true,
                onTap: () => _toggleSelection(true),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOption({
    required String text,
    required bool isSelected,
    required bool isYesValue,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.horizontal(
            right:
                isYesValue ? Radius.circular(widget.borderRadius) : Radius.zero,
            left: !isYesValue
                ? Radius.circular(widget.borderRadius)
                : Radius.zero,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
