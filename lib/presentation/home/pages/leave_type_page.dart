import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/leave_type/delete_leave_type_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/leave_type/get_leave_types_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/add_new_leave.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/add_new_leave_type.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/delete_dialog.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/edit_leave.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/edit_leave_type.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/models/leaves_model.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/app_bar_widget.dart';

class LeaveTypePage extends StatefulWidget {
  const LeaveTypePage({super.key});

  @override
  State<LeaveTypePage> createState() => _LeaveTypePageState();
}

class _LeaveTypePageState extends State<LeaveTypePage> {
  bool isEmptyData = false;
  bool isAddForm = true;
  LeavesModel? leavesModel;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<GetLeaveTypesBloc>().add(const GetLeaveTypesEvent.getLeaveTypes());
  }

  void showEndDrawer(bool isAdd, [LeavesModel? item]) {
    setState(() {
      isAddForm = isAdd;
      leavesModel = item;
    });
    _scaffoldKey.currentState?.openEndDrawer();
  }

  Widget endDrawerWidget() {
    if (isAddForm) {
      return const AddNewLeave();
    }
    return EditLeave(item: leavesModel!);
  }

  String labelStatus(LeaveStatus status) {
    switch (status) {
      case LeaveStatus.pending:
        return 'Pending';
      case LeaveStatus.approve:
        return 'Approve';
      case LeaveStatus.rejected:
        return 'Rejected';
      default:
        return 'Status Not Found!';
    }
  }

  Color colorStatus(LeaveStatus status) {
    switch (status) {
      case LeaveStatus.pending:
        return AppColors.yellow;
      case LeaveStatus.approve:
        return AppColors.green;
      case LeaveStatus.rejected:
        return AppColors.red;
      default:
        return AppColors.gray;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: endDrawerWidget(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Leaves'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: AppColors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Flexible(
                      flex: 3,
                      child: SearchInput(
                        controller: searchController,
                        hintText: 'Quick search..',
                        onChanged: (value) {},
                      ),
                    ),
                    const SpaceWidth(16.0),
                    Button.filled(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => const AddNewLeaveType(),
                      ),
                      label: 'Add New Leave Type',
                      fontSize: 14.0,
                      width: 250.0,
                    ),
                  ],
                ),
              ),
              BlocBuilder<GetLeaveTypesBloc, GetLeaveTypesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const Center(child: CircularProgressIndicator()),
                    loaded: (leaveTypes) {
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    dataRowMinHeight: 30.0,
                                    dataRowMaxHeight: 60.0,
                                    columns: [
                                      DataColumn(
                                        label: SizedBox(
                                          height: 24.0,
                                          width: 24.0,
                                          child: Checkbox(
                                            value: false,
                                            onChanged: (value) {},
                                          ),
                                        ),
                                      ),
                                      const DataColumn(label: Text('Name')),
                                      const DataColumn(label: Text('Is Paid')),
                                      const DataColumn(label: Text('Total Leaves')),
                                      const DataColumn(label: Text('Max Leaves Per Month')),
                                      const DataColumn(label: Text('')),
                                    ],
                                    rows: leaveTypes.isEmpty
                                        ? [
                                            const DataRow(
                                              cells: [
                                                DataCell(
                                                  Row(
                                                    children: [
                                                      Icon(Icons.highlight_off),
                                                      SpaceWidth(4.0),
                                                      Text('Data tidak ditemukan..'),
                                                    ],
                                                  ),
                                                ),
                                                DataCell.empty,
                                                DataCell.empty,
                                                DataCell.empty,
                                                DataCell.empty,
                                                DataCell.empty,
                                              ],
                                            ),
                                          ]
                                        : leaveTypes
                                            .map(
                                              (item) => DataRow(
                                                cells: [
                                                  DataCell(
                                                    SizedBox(
                                                      height: 24.0,
                                                      width: 24.0,
                                                      child: Checkbox(
                                                        value: false,
                                                        onChanged: (value) {},
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                      item.name!,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(Text(item.isPaid! == 1 ? 'Yes' : 'No')),
                                                  DataCell(Text(item.totalLeaves!.toString())),
                                                  DataCell(Text(item.maxLeavePerMonth!.toString())),
                                                  DataCell(
                                                    Row(
                                                      children: [
                                                        BlocListener<DeleteLeaveTypeBloc, DeleteLeaveTypeState>(
                                                          listener: (context, state) {
                                                            state.maybeWhen(
                                                              loaded: () {
                                                                context
                                                                    .read<GetLeaveTypesBloc>()
                                                                    .add(const GetLeaveTypesEvent.getLeaveTypes());
                                                              },
                                                              error: (e) {
                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                  SnackBar(
                                                                      content: Text(e), backgroundColor: Colors.red),
                                                                );
                                                              },
                                                              orElse: () {},
                                                            );
                                                          },
                                                          child: IconButton(
                                                            onPressed: () => showDialog(
                                                              context: context,
                                                              builder: (context) => DeleteDialog(
                                                                onConfirmTap: () {
                                                                  context.read<DeleteLeaveTypeBloc>().add(
                                                                      DeleteLeaveTypeEvent.deleteLeaveType(item.id!));
                                                                  context.pop();
                                                                },
                                                              ),
                                                            ),
                                                            icon: const Icon(
                                                              Icons.delete_outline,
                                                            ),
                                                          ),
                                                        ),
                                                        IconButton(
                                                          onPressed: () => showDialog(
                                                            context: context,
                                                            builder: (context) => EditLeaveType(item: item),
                                                          ),
                                                          icon: const Icon(
                                                            Icons.edit_outlined,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                            .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    orElse: () => const SizedBox(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
