import 'package:flutter/material.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/shift_response_model.dart';

class EditShift extends StatefulWidget {
  final Shift item;
  const EditShift({super.key, required this.item});

  @override
  State<EditShift> createState() => _EditShiftState();
}

class _EditShiftState extends State<EditShift> {
  late final TextEditingController nameController;
  late final TextEditingController lateMarkAfterController;
  late DateTime clockInTime;
  late DateTime clockOutTime;
  late bool isSelfClocking;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.item.name);
    lateMarkAfterController = TextEditingController(text: '${widget.item.lateMarkAfter}');
    // clockInTime = widget.item.clockInTime;
    // clockOutTime = widget.item.clockOutTime;
    // isSelfClocking = widget.item.isSelfClocking;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    lateMarkAfterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth - 600.0,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Shift',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SpaceHeight(16.0),
                Divider(),
              ],
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Row(
              children: [
                Flexible(
                  child: CustomTextField(
                    controller: nameController,
                    label: 'Name',
                    hintText: 'Please Enter Name',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: CustomTimePicker(
                    initialTime: TimeOfDay.fromDateTime(clockInTime),
                    label: 'Clock In Time',
                    hintText: 'Select time',
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            Row(
              children: [
                Flexible(
                  child: CustomTimePicker(
                    initialTime: TimeOfDay.fromDateTime(clockOutTime),
                    label: 'Clock Out Time',
                    hintText: 'Select time',
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: CustomTextField(
                    controller: lateMarkAfterController,
                    label: 'Late Mark After',
                    hintText: 'Please Enter Late Mark After',
                    keyboardType: TextInputType.number,
                    suffixIcon: const SizedBox(
                      width: 80.0,
                      child: Center(
                        child: Text('Minute'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SpaceHeight(16.0),
            YesNoToggle(
              label: 'Self Clocking',
              initialValue: isSelfClocking,
              onChanged: (isYesSelected) {
                isSelfClocking = isYesSelected;
              },
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              const SpaceHeight(16.0),
              Row(
                children: [
                  const Spacer(),
                  Flexible(
                    child: Button.outlined(
                      onPressed: () {},
                      label: 'Cancel',
                    ),
                  ),
                  const SpaceWidth(16.0),
                  Flexible(
                    child: Button.filled(
                      onPressed: () {},
                      label: 'Update',
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
