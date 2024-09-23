import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/leave_type/create_leave_type_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/leave_type/get_leave_types_bloc.dart';

class AddNewLeaveType extends StatefulWidget {
  const AddNewLeaveType({super.key});

  @override
  State<AddNewLeaveType> createState() => _AddNewLeaveTypeState();
}

class _AddNewLeaveTypeState extends State<AddNewLeaveType> {
  late final TextEditingController nameController;
  late final TextEditingController totalLeavesController;
  late final TextEditingController maxLeavePerMonthController;

  bool isPaid = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    totalLeavesController = TextEditingController();
    maxLeavePerMonthController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    totalLeavesController.dispose();
    maxLeavePerMonthController.dispose();
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
                  'Add New Leave Type',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: nameController,
                  label: 'Name',
                  hintText: 'Please Enter Name',
                  textInputAction: TextInputAction.next,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: totalLeavesController,
                  label: 'Total Leaves',
                  hintText: 'Please Enter Total Leaves',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: maxLeavePerMonthController,
                  label: 'Max Leave per Month',
                  hintText: 'Please Enter Max Leave per Month',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isPaid,
                      onChanged: (value) => setState(() => isPaid = value!),
                    ),
                    const SpaceWidth(8.0),
                    const Text('Is Paid'),
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
                    BlocConsumer<CreateLeaveTypeBloc, CreateLeaveTypeState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          loaded: () {
                            context.read<GetLeaveTypesBloc>().add(const GetLeaveTypesEvent.getLeaveTypes());
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
                          loading: () => const Center(child: CircularProgressIndicator()),
                          orElse: () {
                            return Flexible(
                              child: Button.filled(
                                label: 'Create',
                                onPressed: () {
                                  context.read<CreateLeaveTypeBloc>().add(
                                        CreateLeaveTypeEvent.createLeaveType(
                                          name: nameController.text,
                                          totalLeaves: int.parse(totalLeavesController.text),
                                          maxLeavePerMonth: int.parse(maxLeavePerMonthController.text),
                                          isPaid: isPaid,
                                        ),
                                      );
                                },
                              ),
                            );
                          },
                        );
                      },
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
