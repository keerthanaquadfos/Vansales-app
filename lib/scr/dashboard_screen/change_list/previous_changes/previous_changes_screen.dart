import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:van_sales_app/widgets/custom_textfeild.dart';

import '../../../../utils/custom_colors.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_curved_button.dart';
import '../../../../widgets/datepickertextfeild.dart';
import 'previous_changes_controller.dart';

class PreviousChangesScreens extends StatefulWidget {
  const PreviousChangesScreens({super.key});

  @override
  State<PreviousChangesScreens> createState() => _PreviousChangesScreensState();
}

class _PreviousChangesScreensState extends State<PreviousChangesScreens> {
  final TextEditingController _controllerCustemorNmae = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Previous Changes "),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const DatePickerTextField(labelText: "From Date"),
                  const DatePickerTextField(labelText: "To Date"),
                  CustomTextField(
                      controller: _controllerCustemorNmae,
                      text: "Customer Name"),
                  CustomCurvedButton(
                      tittle: "Load",
                      onPressed: () {},
                      buttonheight: 40,
                      buttonwidth: MediaQuery.of(context).size.width * 1),
                ],
              ),
            ),
            const PreviousChangeListTable(),
          ],
        ),
      ),
    );
  }
}

class PreviousChangeListTable extends StatefulWidget {
  const PreviousChangeListTable({super.key});

  @override
  State<PreviousChangeListTable> createState() =>
      _PreviousChangeListTableState();
}

class _PreviousChangeListTableState extends State<PreviousChangeListTable> {
  final PreviousChangeListController previousChangeListController =
      Get.put(PreviousChangeListController());

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
            if (previousChangeListController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: tableHeaderbgColor),
              child: SfDataGrid(
                source: ShopDataSource(previousChangeListController
                    .previousChangeList), //_shopList,

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
                      columnName: "no",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Change No ",
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
  ShopDataSource(List<PreviousChangeList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "si_no", value: dataGridRow.siNo),
              DataGridCell<DateTime>(
                  columnName: "date", value: dataGridRow.date),
              DataGridCell<String>(
                  columnName: "clientcCode", value: dataGridRow.clientcCode),
              DataGridCell<String>(
                  columnName: "clientcName", value: dataGridRow.clientcName),
              // DataGridCell<String>(
              //     columnName: "location", value: dataGridRow.location),
              DataGridCell<double>(columnName: "no", value: dataGridRow.no),
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

class PreviousChangeList {
  int? siNo;
  String? clientcCode;
  String? clientcName;
//String? location;
  double? no;
  DateTime? date;
  PreviousChangeList(
      { //this.location,
      this.date,
      this.clientcCode,
      this.no,
      this.clientcName,
      this.siNo});
}
