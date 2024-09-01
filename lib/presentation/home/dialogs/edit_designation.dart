import 'package:flutter/material.dart';

import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/models/designation_model.dart';

class EditDesignation extends StatefulWidget {
  final DesignationModel item;
  final VoidCallback onConfirmTap;
  const EditDesignation({
    super.key,
    required this.item,
    required this.onConfirmTap,
  });

  @override
  State<EditDesignation> createState() => _EditDesignationState();
}

class _EditDesignationState extends State<EditDesignation> {
  late final TextEditingController designationNameController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    designationNameController =
        TextEditingController(text: widget.item.designationName);
    descriptionController =
        TextEditingController(text: widget.item.description);
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
                  'Edit Designation',
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
