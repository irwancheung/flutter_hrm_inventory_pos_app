import 'package:flutter/material.dart';

import 'package:flutter_hrm_inventory_pos_app/core/core.dart';

class AddNewDesignation extends StatefulWidget {
  final VoidCallback onConfirmTap;
  const AddNewDesignation({super.key, required this.onConfirmTap});

  @override
  State<AddNewDesignation> createState() => _AddNewDesignationState();
}

class _AddNewDesignationState extends State<AddNewDesignation> {
  late final TextEditingController designationNameController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    designationNameController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    designationNameController.dispose();
    descriptionController.dispose();
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
                  'Add New Designation',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: designationNameController,
                  label: 'Name',
                  hintText: 'Please Enter Name',
                  textInputAction: TextInputAction.next,
                ),
                const SpaceHeight(12.0),
                CustomTextField(
                  controller: descriptionController,
                  label: 'Description',
                  hintText: 'Please Enter Description',
                  maxLines: 5,
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
