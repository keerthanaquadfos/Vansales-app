import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:van_sales_app/scr/dashboard_screen/reports/sales_return_register/sales_return_register_controller.dart';
import '../../../../utils/custom_colors.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_curved_button.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../../../widgets/datepickertextfeild.dart';

class SalesReturnRegisterScreenState extends StatefulWidget {
  const SalesReturnRegisterScreenState({super.key});

  @override
  State<SalesReturnRegisterScreenState> createState() =>
      _SalesReturnRegisterScreenStateState();
}

class _SalesReturnRegisterScreenStateState
    extends State<SalesReturnRegisterScreenState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Sales Return Register"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const DatePickerTextField(labelText: "From Date"),
                  const DatePickerTextField(labelText: "To Date"),
                  CustomCurvedButton(
                      tittle: "Submit",
                      onPressed: () {},
                      buttonheight: 40,
                      buttonwidth: MediaQuery.of(context).size.width * 1),
                  CustomCurvedButton(
                      tittle: "PDF",
                      onPressed: () {},
                      buttonheight: 40,
                      buttonwidth: MediaQuery.of(context).size.width * 1),
                ],
              ),
            ),
            const SalesReturnRegistertTable(),
          ],
        ),
      ),
    );
  }
}

class SalesReturnRegistertTable extends StatefulWidget {
  const SalesReturnRegistertTable({super.key});

  @override
  State<SalesReturnRegistertTable> createState() =>
      _SalesReturnRegistertTableState();
}

class _SalesReturnRegistertTableState extends State<SalesReturnRegistertTable> {
  final SalesReturnReportController salesReturnReportController =
      Get.put(SalesReturnReportController());

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
            if (salesReturnReportController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: tableHeaderbgColor),
              child: SfDataGrid(
                source: ShopDataSource(salesReturnReportController
                    .salesReturnRegisterList), //_shopList,

                tableSummaryRows: [
                  GridTableSummaryRow(
                      color: tableHeaderbgColor,
                      showSummaryInRow: false,
                      title: "Total :",
                      columns: [
                        const GridSummaryColumn(
                            name: 'grossAmount',
                            columnName: 'grossAmount',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'discount',
                            columnName: 'discount',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'tax',
                            columnName: 'tax',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'total',
                            columnName: 'total',
                            summaryType: GridSummaryType.sum),
                      ],
                      position: GridTableSummaryRowPosition.bottom),
                ],

                columns: [
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.20,
                      columnName: "cnNo",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "    CN.NO .",
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
                      columnName: "voucherId",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "vouch.ID ",
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
                      columnName: "code",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Code",
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
                      columnName: "customerName",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Customer Name",
                          textAlign: TextAlign.center,
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
                      columnName: "grossAmount",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Gross Amount",
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
                      columnName: "discount",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Discount  ",
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
                      columnName: "tax",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "TAX",
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
                      columnName: "total",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Total",
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
  ShopDataSource(List<SalesReturnRegisterList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "cnNo", value: dataGridRow.cnNo),
              DataGridCell<String>(columnName: "date", value: dataGridRow.date),
              DataGridCell<String>(
                  columnName: "voucherId", value: dataGridRow.voucherId),
              DataGridCell<String>(columnName: "code", value: dataGridRow.code),
              DataGridCell<String>(
                  columnName: "customerName", value: dataGridRow.customerName),
              DataGridCell<double>(
                  columnName: "grossAmount", value: dataGridRow.grossAmount),
              DataGridCell<double>(
                  columnName: "discount", value: dataGridRow.discount),
              DataGridCell<double>(columnName: "tax", value: dataGridRow.tax),
              DataGridCell<double>(
                  columnName: "total", value: dataGridRow.total),
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

class SalesReturnRegisterList {
  int? cnNo;
  String? date;
  String? voucherId;
  String? code;
  double? grossAmount;
  double? discount;
  double? tax;
  double? total;
  String? customerName;
  SalesReturnRegisterList(
      {this.code,
      this.discount,
      this.total,
      this.tax,
      this.customerName,
      this.date,
      this.grossAmount,
      this.voucherId,
      this.cnNo});
}
