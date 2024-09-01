import 'package:flutter/material.dart';

import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/models/departement_model.dart';

class EditDepartement extends StatefulWidget {
  final DepartementModel item;
  final VoidCallback onConfirmTap;
  const EditDepartement({
    super.key,
    required this.item,
    required this.onConfirmTap,
  });

  @override
  State<EditDepartement> createState() => _EditDepartementState();
}

class _EditDepartementState extends State<EditDepartement> {
  late final TextEditingController departementNameController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    departementNameController =
        TextEditingController(text: widget.item.departementName);
    descriptionController =
        TextEditingController(text: widget.item.description);
    super.initState();
  }

  @override
  void dispose() {
    departementNameController.dispose();
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
                  'Edit Department',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: departementNameController,
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
