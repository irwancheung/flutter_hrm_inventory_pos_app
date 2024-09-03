import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/add_new_staff_member.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/delete_dialog.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/edit_new_staff_member.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/models/staff_member_model.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/app_bar_widget.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/pagination_widget.dart';

class StaffMemberPage extends StatefulWidget {
  const StaffMemberPage({super.key});

  @override
  State<StaffMemberPage> createState() => _StaffMemberPageState();
}

class _StaffMemberPageState extends State<StaffMemberPage> {
  bool isEmptyData = false;
  bool isAddForm = true;
  StaffMemberModel? selectedMember;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final searchController = TextEditingController();
  late List<StaffMemberModel> searchResult;

  @override
  void initState() {
    searchResult = staffMembers;
    super.initState();
  }

  void showEndDrawer(bool isAdd, [StaffMemberModel? item]) {
    setState(() {
      isAddForm = isAdd;
      selectedMember = item;
    });
    _scaffoldKey.currentState?.openEndDrawer();
  }

  Widget endDrawerWidget() {
    if (isAddForm) {
      return const AddNewStaffMember();
    }
    return EditStaffMember(item: selectedMember!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: endDrawerWidget(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Staff Member'),
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
                          searchResult = staffMembers
                              .where(
                                (element) => element.name.toLowerCase().contains(
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
                      label: 'Add New Staff Member',
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
                                const DataColumn(label: Text('Shift')),
                                const DataColumn(label: Text('Status')),
                                const DataColumn(label: Text('Departement')),
                                const DataColumn(label: Text('Email address')),
                                const DataColumn(label: Text('Designation')),
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
                                              ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                title: Text(item.name),
                                                titleTextStyle: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.black,
                                                ),
                                                subtitle: Text(item.username),
                                                leading: ClipOval(
                                                  child: CachedNetworkImage(
                                                    imageUrl: item.imageUrl,
                                                    height: 40.0,
                                                    width: 40.0,
                                                    fit: BoxFit.cover,
                                                    placeholder: (context, url) => const Center(
                                                      child: CircularProgressIndicator(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(Text(item.shift)),
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
                                                      backgroundColor: item.isEnabe ? AppColors.green : AppColors.red,
                                                    ),
                                                    const SpaceWidth(8.0),
                                                    Text(item.status),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            DataCell(Text(item.departement)),
                                            DataCell(Text(item.email)),
                                            DataCell(
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 8.0,
                                                  vertical: 4.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                  border: Border.all(
                                                    color: AppColors.stroke,
                                                  ),
                                                  color: AppColors.light,
                                                ),
                                                child: Text(item.designation),
                                              ),
                                            ),
                                            DataCell(
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () => showDialog(
                                                      context: context,
                                                      builder: (context) => DeleteDialog(
                                                        id: 0,
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
