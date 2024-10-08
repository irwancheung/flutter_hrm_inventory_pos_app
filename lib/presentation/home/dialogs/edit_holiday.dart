import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/holiday_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/holiday/get_holidays_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/holiday/update_holiday_bloc.dart';

class EditHoliday extends StatefulWidget {
  final Holiday item;
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

  bool isWeekend = false;

  @override
  void initState() {
    super.initState();
    holidayNameController = TextEditingController(text: widget.item.name);
    datetimeController = TextEditingController(text: widget.item.date.toString());
    isWeekend = widget.item.isWeekend! == 1 ? true : false;
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
                  initialDate: widget.item.date,
                  label: 'Date',
                  hintText: 'Select Date',
                  onDateSelected: (selectedDate) => datetimeController.text = selectedDate.toString(),
                ),
                const SpaceHeight(24.0),
                Row(
                  children: [
                    Checkbox(
                      value: isWeekend,
                      onChanged: (value) => setState(() => isWeekend = value!),
                    ),
                    const SpaceWidth(8.0),
                    const Text('Is Weekend'),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Button.outlined(
                        onPressed: () => context.pop(),
                        label: 'Cancel',
                      ),
                    ),
                    const SpaceWidth(16.0),
                    Flexible(
                      child: BlocConsumer<UpdateHolidayBloc, UpdateHolidayState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            loaded: () {
                              context.read<GetHolidaysBloc>().add(const GetHolidaysEvent.getHolidays());
                              context.pop();
                            },
                            error: (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e), backgroundColor: Colors.red),
                              );
                            },
                            orElse: () {},
                          );
                        },
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () {
                              return Button.filled(
                                onPressed: () {
                                  context.read<UpdateHolidayBloc>().add(
                                        UpdateHolidayEvent.updateHoliday(
                                          id: widget.item.id!,
                                          name: holidayNameController.text,
                                          year: int.parse(datetimeController.text.split('-')[0]),
                                          month: int.parse(datetimeController.text.split('-')[1]),
                                          date: DateTime.parse(datetimeController.text),
                                          isWeekend: isWeekend,
                                        ),
                                      );
                                },
                                label: 'Update',
                              );
                            },
                          );
                        },
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
