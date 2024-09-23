import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/role/delete_role_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/role/get_roles_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/add_new_role.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/delete_dialog.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/edit_permission_user.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/edit_role.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/models/user_management_model.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/app_bar_widget.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  bool isEmptyData = false;
  bool isAddForm = true;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<GetRolesBloc>().add(const GetRolesEvent.getRoles());
  }

  void showEndDrawer(bool isAdd, [UserManagementModel? item]) {
    setState(() {
      isAddForm = isAdd;
    });
    // delete condition when UI add role is available
    if (!isAdd) {
      _scaffoldKey.currentState?.openEndDrawer();
    }
  }

  Widget endDrawerWidget() {
    if (isAddForm) {
      return const SizedBox.shrink();
    }
    return const EditPermissionUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: endDrawerWidget(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'User Management'),
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
                        builder: (context) => const AddNewRole(),
                      ),
                      label: 'Add New Role',
                      fontSize: 14.0,
                      width: 200.0,
                    ),
                  ],
                ),
              ),
              BlocBuilder<GetRolesBloc, GetRolesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const Center(child: CircularProgressIndicator()),
                    loaded: (roles) {
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
                                      const DataColumn(label: Text('Role Name')),
                                      const DataColumn(label: Text('Description')),
                                      const DataColumn(label: Text('')),
                                    ],
                                    rows: roles.isEmpty
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
                                              ],
                                            ),
                                          ]
                                        : roles
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
                                                  DataCell(Text(item.name!)),
                                                  DataCell(Text(item.description!)),
                                                  DataCell(
                                                    Row(
                                                      children: [
                                                        BlocListener<DeleteRoleBloc, DeleteRoleState>(
                                                          listener: (context, state) {
                                                            state.maybeWhen(
                                                              loaded: () {
                                                                context
                                                                    .read<GetRolesBloc>()
                                                                    .add(const GetRolesEvent.getRoles());
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
                                                                  context
                                                                      .read<DeleteRoleBloc>()
                                                                      .add(DeleteRoleEvent.deleteRole(item.id!));
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
                                                            builder: (context) => EditRole(item: item),
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
