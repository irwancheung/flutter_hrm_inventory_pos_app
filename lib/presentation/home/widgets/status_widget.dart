import 'package:flutter/material.dart';

import 'package:flutter_hrm_inventory_pos_app/core/core.dart';

enum StatusEnum { present, leave, notMarked }

class StatusWidget extends StatelessWidget {
  final StatusEnum status;
  const StatusWidget(this.status, {super.key});

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (status == StatusEnum.present) {
        return AppColors.green;
      } else if (status == StatusEnum.leave) {
        return AppColors.red;
      }
      return AppColors.blue;
    }

    String getText() {
      if (status == StatusEnum.present) {
        return 'Present';
      } else if (status == StatusEnum.leave) {
        return 'Leave';
      }
      return 'Not Marked';
    }

    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: getColor().withOpacity(0.2),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Text(
        getText(),
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          color: getColor(),
        ),
      ),
    );
  }
}
