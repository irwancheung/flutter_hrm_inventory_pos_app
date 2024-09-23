import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/designation/delete_designation_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/bloc/designation/get_designations_bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/add_new_designation.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/delete_dialog.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/edit_designation.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/app_bar_widget.dart';

class DesignationPage extends StatefulWidget {
  const DesignationPage({super.key});

  @override
  State<DesignationPage> createState() => _DesignationPageState();
}

class _DesignationPageState extends State<DesignationPage> {
  bool isEmptyData = false;

  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<GetDesignationsBloc>().add(const GetDesignationsEvent.getDesignations());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Designation'),
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
                        builder: (context) => const AddNewDesignation(),
                      ),
                      label: 'Add New Designation',
                      fontSize: 14.0,
                      width: 250.0,
                    ),
                  ],
                ),
              ),
              BlocBuilder<GetDesignationsBloc, GetDesignationsState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    loaded: (designations) {
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
                                      const DataColumn(
                                        label: Text('Designation Name'),
                                      ),
                                      const DataColumn(label: Text('Description')),
                                      const DataColumn(label: Text('')),
                                    ],
                                    rows: designations.isEmpty
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
                                        : designations
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
                                                        BlocListener<DeleteDesignationBloc, DeleteDesignationState>(
                                                          listener: (context, state) {
                                                            state.maybeWhen(
                                                              loaded: () {
                                                                context
                                                                    .read<GetDesignationsBloc>()
                                                                    .add(const GetDesignationsEvent.getDesignations());
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
                                                                  context.read<DeleteDesignationBloc>().add(
                                                                      DeleteDesignationEvent.deleteDesignation(
                                                                          item.id!));
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
                                                            builder: (context) => EditDesignation(
                                                              item: item,
                                                              onConfirmTap: () {},
                                                            ),
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
                              // if (searchResult.isNotEmpty)
                              //   const Padding(
                              //     padding: EdgeInsets.all(16.0),
                              //     child: PaginationWidget(),
                              //   ),
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
