import 'package:flutter/material.dart';

import 'package:flutter_hrm_inventory_pos_app/core/core.dart';

class DeleteDialog extends StatelessWidget {
  final VoidCallback onConfirmTap;
  const DeleteDialog({super.key, required this.onConfirmTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sure you want to Delete?',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SpaceHeight(8.0),
            const Text('Are you sure you want to Delete this?'),
            const SpaceHeight(24.0),
            Row(
              children: [
                Flexible(
                    child: Button.outlined(
                  onPressed: () => context.pop(),
                  label: 'No, cancel',
                ),),
                const SpaceWidth(16.0),
                Flexible(
                  child: Button.filled(
                    onPressed: onConfirmTap,
                    label: 'Yes, Confirm',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
