import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/department_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/department/get_departments_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/department/update_department_bloc.dart';

class EditDepartement extends StatefulWidget {
  final Department item;
  const EditDepartement({super.key, required this.item});

  @override
  State<EditDepartement> createState() => _EditDepartementState();
}

class _EditDepartementState extends State<EditDepartement> {
  late final TextEditingController departementNameController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    departementNameController = TextEditingController(text: widget.item.name);
    descriptionController = TextEditingController(text: widget.item.description);
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
                      ),
                    ),
                    const SpaceWidth(16.0),
                    Flexible(
                      child: BlocConsumer<UpdateDepartmentBloc, UpdateDepartmentState>(
                        listener: (context, state) {
                          state.maybeWhen(
                            loaded: () {
                              context.read<GetDepartmentsBloc>().add(const GetDepartmentsEvent.getDepartments());
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
                              return Button.filled(
                                onPressed: () {
                                  context.read<UpdateDepartmentBloc>().add(
                                        UpdateDepartmentEvent.updateDepartment(
                                          id: widget.item.id!,
                                          name: departementNameController.text,
                                          description: descriptionController.text,
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
