import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/department_response_model.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/department/delete_department_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/department/get_departments_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/add_new_departement.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/delete_dialog.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/edit_departement.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/app_bar_widget.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/pagination_widget.dart';

class DepartementPage extends StatefulWidget {
  const DepartementPage({super.key});

  @override
  State<DepartementPage> createState() => _DepartementPageState();
}

class _DepartementPageState extends State<DepartementPage> {
  bool isEmptyData = false;

  final searchController = TextEditingController();
  late List<Department> searchResult;

  @override
  void initState() {
    super.initState();
    searchResult = [];
    context.read<GetDepartmentsBloc>().add(const GetDepartmentsEvent.getDepartments());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Departement'),
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
                        onChanged: (value) {
                          // searchResult = departements
                          //     .where(
                          //       (element) =>
                          //           element.departementName.toLowerCase().contains(searchController.text.toLowerCase()),
                          //     )
                          //     .toList();
                          // setState(() {});
                        },
                      ),
                    ),
                    const SpaceWidth(16.0),
                    Button.filled(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => const AddNewDepartement(),
                      ),
                      label: 'Add New Departement',
                      fontSize: 14.0,
                      width: 250.0,
                    ),
                  ],
                ),
              ),
              BlocBuilder<GetDepartmentsBloc, GetDepartmentsState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox(),
                    loading: () {
                      return const Padding(
                        padding: EdgeInsets.all(70),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    loaded: (departments) {
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
                                      const DataColumn(label: Text('Departement Name')),
                                      const DataColumn(label: Text('Description')),
                                      const DataColumn(label: Text('')),
                                    ],
                                    rows: departments.isEmpty
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
                                        : departments
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
                                                        fontSize: 16.0,
                                                        fontWeight: FontWeight.w500,
                                                        color: AppColors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(Text(item.description!)),
                                                  DataCell(
                                                    Row(
                                                      children: [
                                                        BlocConsumer<DeleteDepartmentBloc, DeleteDepartmentState>(
                                                          listener: (context, state) {
                                                            state.maybeWhen(
                                                              loaded: () {
                                                                context
                                                                    .read<GetDepartmentsBloc>()
                                                                    .add(const GetDepartmentsEvent.getDepartments());
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
                                                          builder: (context, state) {
                                                            return IconButton(
                                                              onPressed: () => showDialog(
                                                                context: context,
                                                                builder: (context) => DeleteDialog(
                                                                  onConfirmTap: () {
                                                                    context.read<DeleteDepartmentBloc>().add(
                                                                          DeleteDepartmentEvent.deleteDepartment(
                                                                              item.id!),
                                                                        );
                                                                    context.pop();
                                                                  },
                                                                ),
                                                              ),
                                                              icon: const Icon(Icons.delete_outline),
                                                            );
                                                          },
                                                        ),
                                                        IconButton(
                                                          onPressed: () => showDialog(
                                                            context: context,
                                                            builder: (context) => EditDepartement(item: item),
                                                          ),
                                                          icon: const Icon(Icons.edit_outlined),
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
                              if (departments.isNotEmpty)
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: PaginationWidget(),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
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
