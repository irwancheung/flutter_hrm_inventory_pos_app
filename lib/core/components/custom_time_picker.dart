import 'package:flutter/material.dart';

import '../core.dart';

class CustomTimePicker extends StatefulWidget {
  final void Function(TimeOfDay selectedTime)? onTimeSelected;
  final TimeOfDay? initialTime;
  final Widget? prefix;
  final String label;
  final bool showLabel;
  final String? hintText;
  final double borderRadius;

  const CustomTimePicker({
    super.key,
    required this.label,
    this.showLabel = true,
    this.initialTime,
    this.onTimeSelected,
    this.prefix,
    this.hintText,
    this.borderRadius = 18.0,
  });

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  late TextEditingController controller;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    controller = TextEditingController(
      text: widget.initialTime?.toFormattedTime(),
    );
    selectedTime = widget.initialTime ?? TimeOfDay.now();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        controller.text = selectedTime.toFormattedTime();
      });
      if (widget.onTimeSelected != null) {
        widget.onTimeSelected!(picked);
      }
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
        TextFormField(
          controller: controller,
          onTap: () => _selectTime(context),
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: AppColors.stroke),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: const BorderSide(color: AppColors.stroke),
            ),
            suffixIcon: const Icon(Icons.access_time),
            hintText: widget.initialTime != null
                ? selectedTime.toFormattedTime()
                : widget.hintText ?? widget.label,
          ),
        ),
      ],
    );
  }
}
