import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../utils/custom_colors.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_curved_button.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../../../widgets/datepickertextfeild.dart';
import 'sales_summary_report_controller.dart';

class SalesSummaryReportScreen extends StatefulWidget {
  const SalesSummaryReportScreen({super.key});

  @override
  State<SalesSummaryReportScreen> createState() =>
      _SalesSummaryReportScreenState();
}

class _SalesSummaryReportScreenState extends State<SalesSummaryReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Sales Summary Report "),
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
                ],
              ),
            ),
            const SalesSummaryReportTable(),
          ],
        ),
      ),
    );
  }
}

class SalesSummaryReportTable extends StatefulWidget {
  const SalesSummaryReportTable({super.key});

  @override
  State<SalesSummaryReportTable> createState() =>
      _SalesSummaryReportTableState();
}

class _SalesSummaryReportTableState extends State<SalesSummaryReportTable> {
  final SalesSummaryReportController salesSummaryReportController =
      Get.put(SalesSummaryReportController());

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
            if (salesSummaryReportController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: tableHeaderbgColor),
              child: SfDataGrid(
                source: ShopDataSource(salesSummaryReportController
                    .salesSummaryReportList), //_shopList,

                tableSummaryRows: [
                  GridTableSummaryRow(
                      color: tableHeaderbgColor,
                      showSummaryInRow: false,
                      title: "Total :",
                      columns: [
                        const GridSummaryColumn(
                            name: 'quantity',
                            columnName: 'quantity',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'grossAmount',
                            columnName: 'grossAmount',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'discountRate',
                            columnName: 'discountRate',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'taxableValue',
                            columnName: 'taxableValue',
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
                      columnName: "customername",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Cu. Name",
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
                      columnName: "voucherNo",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "vouch.No ",
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
                      columnName: "name",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Name",
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
                      columnName: "quantity",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Quantity ",
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
                      columnName: "unitRate",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Unit Rate",
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
                      columnName: "discountRate",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Discount Rate ",
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
                      columnName: "taxableValue",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Taxable Value",
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
  ShopDataSource(List<SalesSummaryReportList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "si_no", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "customername", value: dataGridRow.customername),
              DataGridCell<String>(
                  columnName: "voucherNo", value: dataGridRow.voucherNo),
              DataGridCell<String>(columnName: "name", value: dataGridRow.name),
              DataGridCell<double>(
                  columnName: "quantity", value: dataGridRow.quantity),
              DataGridCell<String>(
                  columnName: "unitRate", value: dataGridRow.unitRate),
              DataGridCell<double>(
                  columnName: "grossAmount", value: dataGridRow.grossAmount),
              DataGridCell<double>(
                  columnName: "discountRate", value: dataGridRow.discountRate),
              DataGridCell<double>(
                  columnName: "taxableValue", value: dataGridRow.taxableValue),
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

class SalesSummaryReportList {
  int? siNo;
  String? customername;
  String? voucherNo;
  String? name;
  double? quantity;
  double? grossAmount;
  double? discountRate;
  double? taxableValue;
  double? tax;
  double? total;
  String? unitRate;
  SalesSummaryReportList(
      {this.name,
      this.discountRate,
      this.total,
      this.taxableValue,
      this.tax,
      this.unitRate,
      this.customername,
      this.grossAmount,
      this.quantity,
      this.voucherNo,
      this.siNo});
}
