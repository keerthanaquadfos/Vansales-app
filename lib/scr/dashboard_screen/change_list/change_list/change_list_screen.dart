import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:van_sales_app/scr/dashboard_screen/change_list/previous_changes/previous_changes_screen.dart';

import '../../../../utils/custom_colors.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_curved_button.dart';
import 'change_list_controller.dart';

class ChangrListScreen extends StatefulWidget {
  const ChangrListScreen({super.key});

  @override
  State<ChangrListScreen> createState() => _ChangrListScreenState();
}

class _ChangrListScreenState extends State<ChangrListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Change List Report "),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CustomCurvedButton(
                      tittle: "Delete All",
                      onPressed: () {},
                      buttonheight: 40,
                      buttonwidth: MediaQuery.of(context).size.width * 1),
                  CustomCurvedButton(
                      tittle: "Previous ",
                      onPressed: () {
                        Get.to(const PreviousChangesScreens());
                      },
                      buttonheight: 40,
                      buttonwidth: MediaQuery.of(context).size.width * 1),
                ],
              ),
            ),
            const ChangeListTable(),
          ],
        ),
      ),
    );
  }
}

class ChangeListTable extends StatefulWidget {
  const ChangeListTable({super.key});

  @override
  State<ChangeListTable> createState() => _ChangeListTableState();
}

class _ChangeListTableState extends State<ChangeListTable> {
  final ChangeListController changeListController =
      Get.put(ChangeListController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .5,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: gridBorderColor)),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SfDataGridTheme(
          data: SfDataGridThemeData(
              headerColor: gridHeaderColor, gridLineColor: gridBorderColor),
          child: Obx(() {
            if (changeListController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: tableHeaderbgColor),
              child: SfDataGrid(
                source: ShopDataSource(
                    changeListController.changeList), //_shopList,

                columns: [
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.20,
                      columnName: "si_no",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "    SI.NO .",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.20,
                      columnName: "clientcCode",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Client. Code",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.20,
                      columnName: "clientcName",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Clientc Name ",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.20,
                      columnName: "location",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Location",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.20,
                      columnName: "no",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "No ",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.20,
                      columnName: "date",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Date",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                ],
              ),
            );
          })),
    );
  }
}

class ShopDataSource extends DataGridSource {
  ShopDataSource(List<ChangeList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "si_no", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "clientcCode", value: dataGridRow.clientcCode),
              DataGridCell<String>(
                  columnName: "clientcName", value: dataGridRow.clientcName),
              DataGridCell<String>(
                  columnName: "location", value: dataGridRow.location),
              DataGridCell<double>(columnName: "no", value: dataGridRow.no),
              DataGridCell<DateTime>(
                  columnName: "date", value: dataGridRow.date),
            ]))
        .toList();
  }

  late List<DataGridRow> dataGridRows;
  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  Widget? buildTableSummaryCellWidget(
      GridTableSummaryRow summaryRow,
      GridSummaryColumn? summaryColumn,
      RowColumnIndex rowColumnIndex,
      String summaryValue) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      alignment: Alignment.center,
      child: Text(summaryValue),
    );
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Text(
          dataGridCell.value.toString(),
          style: const TextStyle(
            fontFamily: "poppins",
            fontWeight: FontWeight.w500,
            fontSize: 10,
            color: complaintTailDateTimeColor,
          ),
        ),
      );
    }).toList());
  }
}

class ChangeList {
  int? siNo;
  String? clientcCode;
  String? clientcName;
  String? location;
  double? no;
  DateTime? date;
  ChangeList(
      {this.location,
      this.date,
      this.clientcCode,
      this.no,
      this.clientcName,
      this.siNo});
}
