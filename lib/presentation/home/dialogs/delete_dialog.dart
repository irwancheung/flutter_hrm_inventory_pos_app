import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/delete_department_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/get_departments_bloc.dart';

class DeleteDialog extends StatelessWidget {
  final int id;
  final VoidCallback onConfirmTap;
  const DeleteDialog({super.key, required this.id, required this.onConfirmTap});

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
                  ),
                ),
                const SpaceWidth(16.0),
                Flexible(
                  child: BlocConsumer<DeleteDepartmentBloc, DeleteDepartmentState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        loaded: () {
                          context.read<GetDepartmentsBloc>().add(const GetDepartmentsEvent.getDepartments());
                          context.pop();
                        },
                        error: (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e), backgroundColor: Colors.red),
                          );
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return Button.filled(
                            onPressed: () {
                              context.read<DeleteDepartmentBloc>().add(DeleteDepartmentEvent.deleteDepartment(id));
                            },
                            label: 'Yes, Confirm',
                          );
                        },
                        loading: () => const Center(child: CircularProgressIndicator()),
                      );
                    },
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
