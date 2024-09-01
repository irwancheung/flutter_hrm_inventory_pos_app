import 'package:flutter/material.dart';

import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/add_new_shift.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/delete_dialog.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/edit_shift.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/models/shift_model.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/app_bar_widget.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/pagination_widget.dart';

class ShiftPage extends StatefulWidget {
  const ShiftPage({super.key});

  @override
  State<ShiftPage> createState() => _ShiftPageState();
}

class _ShiftPageState extends State<ShiftPage> {
  bool isEmptyData = false;
  bool isAddForm = true;
  ShiftModel? shiftModel;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();
  late List<ShiftModel> searchResult;

  @override
  void initState() {
    searchResult = shifts;
    super.initState();
  }

  void showEndDrawer(bool isAdd, [ShiftModel? item]) {
    setState(() {
      isAddForm = isAdd;
      shiftModel = item;
    });
    _scaffoldKey.currentState?.openEndDrawer();
  }

  Widget endDrawerWidget() {
    if (isAddForm) {
      return const AddNewShift();
    }
    return EditShift(item: shiftModel!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: endDrawerWidget(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Shift'),
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
                          searchResult = shifts
                              .where((element) => element.name
                                  .toLowerCase()
                                  .contains(
                                      searchController.text.toLowerCase(),),)
                              .toList();
                          setState(() {});
                        },
                      ),
                    ),
                    const SpaceWidth(16.0),
                    Button.filled(
                      onPressed: () => showEndDrawer(true),
                      label: 'Add New Shift',
                      fontSize: 14.0,
                      width: 250.0,
                    ),
                  ],
                ),
              ),
              if (isEmptyData) ...[
                const Padding(
                  padding: EdgeInsets.all(70.0),
                  child: Center(
                    child: EmptyPlaceholder2(),
                  ),
                ),
              ] else ...[
                Expanded(
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
                                const DataColumn(label: Text('Clock In Time')),
                                const DataColumn(label: Text('Clock Out Time')),
                                const DataColumn(label: Text('Self Clocking')),
                                const DataColumn(
                                    label: Text('Late Mark After'),),
                                const DataColumn(label: Text('')),
                              ],
                              rows: searchResult.isEmpty
                                  ? [
                                      const DataRow(
                                        cells: [
                                          DataCell(Row(
                                            children: [
                                              Icon(Icons.highlight_off),
                                              SpaceWidth(4.0),
                                              Text('Data tidak ditemukan..'),
                                            ],
                                          ),),
                                          DataCell.empty,
                                          DataCell.empty,
                                          DataCell.empty,
                                          DataCell.empty,
                                          DataCell.empty,
                                          DataCell.empty,
                                        ],
                                      ),
                                    ]
                                  : searchResult
                                      .map(
                                        (item) => DataRow(cells: [
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
                                          DataCell(Text(
                                            item.name,
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black,
                                            ),
                                          ),),
                                          DataCell(Text(item.clockInTime
                                              .toFormattedTime(),),),
                                          DataCell(Text(item.clockOutTime
                                              .toFormattedTime(),),),
                                          DataCell(Text(
                                              '${item.lateMarkAfter} Minutes',),),
                                          DataCell(Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 4.0,),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              border: Border.all(
                                                  color: AppColors.stroke,),
                                            ),
                                            child: Row(
                                              children: [
                                                Badge(
                                                  backgroundColor:
                                                      item.isSelfClocking
                                                          ? AppColors.green
                                                          : AppColors.red,
                                                ),
                                                const SpaceWidth(8.0),
                                                Text(item.selfClocking),
                                              ],
                                            ),
                                          ),),
                                          DataCell(Row(
                                            children: [
                                              IconButton(
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      DeleteDialog(
                                                    onConfirmTap: () {},
                                                  ),
                                                ),
                                                icon: const Icon(
                                                    Icons.delete_outline,),
                                              ),
                                              IconButton(
                                                onPressed: () =>
                                                    showEndDrawer(false, item),
                                                icon: const Icon(
                                                    Icons.edit_outlined,),
                                              ),
                                            ],
                                          ),),
                                        ],),
                                      )
                                      .toList(),
                            ),
                          ),
                        ),
                        if (searchResult.isNotEmpty)
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: PaginationWidget(),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
