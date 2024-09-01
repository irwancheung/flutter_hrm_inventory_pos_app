import 'package:flutter/material.dart';

import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/models/holiday_model.dart';

class EditHoliday extends StatefulWidget {
  final HolidayModel item;
  final VoidCallback onConfirmTap;
  const EditHoliday({
    super.key,
    required this.item,
    required this.onConfirmTap,
  });

  @override
  State<EditHoliday> createState() => _EditHolidayState();
}

class _EditHolidayState extends State<EditHoliday> {
  late final TextEditingController holidayNameController;
  late final TextEditingController datetimeController;

  @override
  void initState() {
    holidayNameController =
        TextEditingController(text: widget.item.holidayName);
    datetimeController =
        TextEditingController(text: widget.item.datetime.toString());
    super.initState();
  }

  @override
  void dispose() {
    holidayNameController.dispose();
    datetimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 500.0,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edit Holiday',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: holidayNameController,
                  label: 'Name',
                  hintText: 'Please Enter Name',
                  textInputAction: TextInputAction.next,
                ),
                const SpaceHeight(12.0),
                CustomDatePicker(
                  initialDate: widget.item.datetime,
                  label: 'Date',
                  hintText: 'Select Date',
                  onDateSelected: (selectedDate) =>
                      datetimeController.text = selectedDate.toString(),
                ),
                const SpaceHeight(24.0),
                Row(
                  children: [
                    Flexible(
                        child: Button.outlined(
                      onPressed: () => context.pop(),
                      label: 'Cancel',
                    ),),
                    const SpaceWidth(16.0),
                    Flexible(
                      child: Button.filled(
                        onPressed: widget.onConfirmTap,
                        label: 'Update',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
