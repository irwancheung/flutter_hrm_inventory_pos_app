import 'package:flutter/material.dart';
import 'package:flutter_hrm_inventory_pos_app/core/core.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/add_new_holiday.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/delete_dialog.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/dialogs/edit_holiday.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/models/holiday_model.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/app_bar_widget.dart';
import 'package:flutter_hrm_inventory_pos_app/presentation/home/widgets/pagination_widget.dart';

class HolidayPage extends StatefulWidget {
  const HolidayPage({super.key});

  @override
  State<HolidayPage> createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> {
  bool isEmptyData = false;

  final searchController = TextEditingController();
  late List<HolidayModel> searchResult;

  @override
  void initState() {
    searchResult = holidays;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBarWidget(title: 'Holiday'),
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
                          searchResult = holidays
                              .where(
                                (element) => element.holidayName.toLowerCase().contains(
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
                      onPressed: () => showDialog(
                        context: context,
                        builder: (context) => AddNewHoliday(
                          onConfirmTap: () {},
                        ),
                      ),
                      label: 'Add New Holiday',
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
                                const DataColumn(label: Text('Holiday Name')),
                                const DataColumn(label: Text('Date')),
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
                                                item.holidayName,
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                item.datetime.toFormattedDate(),
                                              ),
                                            ),
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
                                                    onPressed: () => showDialog(
                                                      context: context,
                                                      builder: (context) => EditHoliday(
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
