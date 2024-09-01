import 'package:flutter/material.dart';

import 'package:flutter_hrm_inventory_pos_app/core/core.dart';

class AddNewHoliday extends StatefulWidget {
  final VoidCallback onConfirmTap;
  const AddNewHoliday({super.key, required this.onConfirmTap});

  @override
  State<AddNewHoliday> createState() => _AddNewHolidayState();
}

class _AddNewHolidayState extends State<AddNewHoliday> {
  late final TextEditingController holidayNameController;
  late final TextEditingController datetimeController;

  @override
  void initState() {
    holidayNameController = TextEditingController();
    datetimeController = TextEditingController();
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
                  'Add New Holiday',
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
                        label: 'Create',
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
