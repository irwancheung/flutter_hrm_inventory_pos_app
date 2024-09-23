import 'package:flutter/material.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/add_new_leave.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/delete_dialog.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/edit_leave.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/models/leaves_model.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/app_bar_widget.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/pagination_widget.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  bool isEmptyData = false;
  bool isAddForm = true;
  LeavesModel? leavesModel;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();
  late List<LeavesModel> searchResult;

  @override
  void initState() {
    searchResult = leaves;
    super.initState();
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
                        onChanged: (value) {
                          searchResult = leaves
                              .where(
                                (element) => element.user.toLowerCase().contains(
                                      searchController.text.toLowerCase(),
                                    ),
                              )
                              .toList();
                          setState(() {});
                        },
                      ),
                    ),
                    const SpaceWidth(16.0),
                    Button.filled(
                      onPressed: () => showEndDrawer(true),
                      label: 'Add New Leave',
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
                                const DataColumn(label: Text('User Name')),
                                const DataColumn(label: Text('Leave Type')),
                                const DataColumn(label: Text('Start Date')),
                                const DataColumn(label: Text('End Date')),
                                const DataColumn(label: Text('Status')),
                                const DataColumn(label: Text('Reason')),
                                const DataColumn(label: Text('')),
                              ],
                              rows: searchResult.isEmpty
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
                                          DataCell.empty,
                                          DataCell.empty,
                                        ],
                                      ),
                                    ]
                                  : searchResult
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
                                                item.user,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                            ),
                                            DataCell(Text(item.leaveType)),
                                            DataCell(
                                              Text(
                                                item.startDate.toFormattedDate(),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                '${item.endDate.toFormattedDate()} ${item.isHalfDay ? '(Half Day)' : ''}',
                                              ),
                                            ),
                                            DataCell(
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 8.0,
                                                  vertical: 4.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(6.0),
                                                  border: Border.all(
                                                    color: AppColors.stroke,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Badge(
                                                      backgroundColor: colorStatus(item.status),
                                                    ),
                                                    const SpaceWidth(8.0),
                                                    Text(labelStatus(item.status)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            DataCell(Text(item.reason)),
                                            DataCell(
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () => showDialog(
                                                      context: context,
                                                      builder: (context) => DeleteDialog(
                                                        onConfirmTap: () {},
                                                      ),
                                                    ),
                                                    icon: const Icon(
                                                      Icons.delete_outline,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () => showEndDrawer(false, item),
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
