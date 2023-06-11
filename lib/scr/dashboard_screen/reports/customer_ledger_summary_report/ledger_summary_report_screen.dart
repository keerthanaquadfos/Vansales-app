import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../utils/custom_colors.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../../widgets/datepickertextfeild.dart';
import 'ledger_summary_report_controller.dart';

class LedgerSummaryReport extends StatefulWidget {
  const LedgerSummaryReport({super.key});

  @override
  State<LedgerSummaryReport> createState() => _LedgerSummaryReportState();
}

class _LedgerSummaryReportState extends State<LedgerSummaryReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const TitleOnltyCustomAppBar(title: "Customer Ledger Summary Report"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const DatePickerTextField(labelText: "Date"),
                CustomCurvedButton(
                    tittle: "Search",
                    onPressed: () {},
                    buttonheight: 40,
                    buttonwidth: MediaQuery.of(context).size.width * 1),
              ],
            ),
          ),
          const LedgerSummaryReportTable(),
        ],
      ),
    );
  }
}

////////////////////////////////////////
class LedgerSummaryReportTable extends StatefulWidget {
  const LedgerSummaryReportTable({super.key});

  @override
  State<LedgerSummaryReportTable> createState() =>
      _LedgerSummaryReportTableState();
}

class _LedgerSummaryReportTableState extends State<LedgerSummaryReportTable> {
  final LedgerSummaryReportController ledgerSummaryReportController =
      Get.put(LedgerSummaryReportController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: gridBorderColor)),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SfDataGridTheme(
          data: SfDataGridThemeData(
              headerColor: gridHeaderColor, gridLineColor: gridBorderColor),
          child: Obx(() {
            if (ledgerSummaryReportController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: tableHeaderbgColor),
              child: SfDataGrid(
                source: ShopDataSource(ledgerSummaryReportController
                    .ledgerSummaryReportList), //_shopList,

                tableSummaryRows: [
                  GridTableSummaryRow(
                      showSummaryInRow: false,
                      columns: [
                        const GridSummaryColumn(
                            name: 'openingbalance',
                            columnName: 'openingbalance',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'credit',
                            columnName: 'credit',
                            summaryType: GridSummaryType.sum)
                      ],
                      position: GridTableSummaryRowPosition.bottom)
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
                      columnName: "customer",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Customer",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.40,
                      columnName: "openingbalance",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Opening Balance",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.40,
                      columnName: "debit",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Debit",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.40,
                      columnName: "credit",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Credit",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.40,
                      columnName: "closingbalance",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Closing Balance",
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
  ShopDataSource(List<LedgerSummaryReportList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "si_no", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "customer", value: dataGridRow.customer),
              DataGridCell<double>(
                  columnName: "openingbalance",
                  value: dataGridRow.openingbalance),
              DataGridCell<double>(
                  columnName: "debit", value: dataGridRow.debit),
              DataGridCell<double>(
                  columnName: "credit", value: dataGridRow.credit),
              DataGridCell<double>(
                  columnName: "closingbalance",
                  value: dataGridRow.closingbalance),
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

class LedgerSummaryReportList {
  int? siNo;
  String? customer;

  double? closingbalance;
  double? openingbalance;
  double? debit;
  double? credit;

  LedgerSummaryReportList(
      {this.customer,
      this.credit,
      this.openingbalance,
      this.debit,
      this.closingbalance,
      this.siNo});
}
