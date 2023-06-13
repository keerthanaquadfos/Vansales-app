import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../utils/custom_colors.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_curved_button.dart';
import '../../../../widgets/custom_dropdown.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../../../widgets/datepickertextfeild.dart';
import 'stock_register_report_controller.dart';

class StockRegisterReportScreen extends StatefulWidget {
  const StockRegisterReportScreen({super.key});

  @override
  State<StockRegisterReportScreen> createState() =>
      _StockRegisterReportScreenState();
}

class _StockRegisterReportScreenState extends State<StockRegisterReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Stock Register Report "),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const DatePickerTextField(labelText: "From Date"),
                  const DatePickerTextField(labelText: "To Date"),
                  CustemDropdown(
                    boxwidth: MediaQuery.of(context).size.width * 1,
                    itemcount: 2,
                    texthint: "type",
                    itemlist: customertypeitemlist,
                  ),
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
            const StockRegisterReportTable(),
          ],
        ),
      ),
    );
  }
}

class StockRegisterReportTable extends StatefulWidget {
  const StockRegisterReportTable({super.key});

  @override
  State<StockRegisterReportTable> createState() =>
      _StockRegisterReportTableState();
}

class _StockRegisterReportTableState extends State<StockRegisterReportTable> {
  final StockRegisterReportController stockregisterReportController =
      Get.put(StockRegisterReportController());

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
            if (stockregisterReportController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: tableHeaderbgColor),
              child: SfDataGrid(
                source: ShopDataSource(stockregisterReportController
                    .stockRegiterReportList), //_shopList,

                tableSummaryRows: [
                  GridTableSummaryRow(
                      color: tableHeaderbgColor,
                      showSummaryInRow: false,
                      title: "Total :",
                      columns: [
                        const GridSummaryColumn(
                            name: 'openingstock',
                            columnName: 'openingstock',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'issued',
                            columnName: 'issued',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'changein',
                            columnName: 'changein',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'returnitem',
                            columnName: 'returnitem',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'sold',
                            columnName: 'sold',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'offloaded',
                            columnName: 'offloaded',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'change',
                            columnName: 'change',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'closing',
                            columnName: 'closing',
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
                      columnName: "productname",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Product Name",
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
                          "Code ",
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
                      columnName: "openingstock",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Opening Stock",
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
                      columnName: "issued",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Issued",
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
                      columnName: "changein",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Change In ",
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
                      columnName: "returnitem",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Return",
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
                      columnName: "sold",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Sold",
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
                      columnName: "offloaded",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Offloaded",
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
                      columnName: "change",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Change",
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
                      columnName: "closing",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Closing",
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
                      columnName: "unit",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Unit",
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
  ShopDataSource(List<StockRegiterReportList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "si_no", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "productname", value: dataGridRow.productname),
              DataGridCell<String>(columnName: "code", value: dataGridRow.code),
              DataGridCell<double>(
                  columnName: "openingstock", value: dataGridRow.openingstock),
              DataGridCell<double>(
                  columnName: "issued", value: dataGridRow.issued),
              DataGridCell<double>(
                  columnName: "changein", value: dataGridRow.changein),
              DataGridCell<double>(
                  columnName: "returnitem", value: dataGridRow.returnitem),
              DataGridCell<double>(columnName: "sold", value: dataGridRow.sold),
              DataGridCell<double>(
                  columnName: "offloaded", value: dataGridRow.offloaded),
              DataGridCell<double>(
                  columnName: "change", value: dataGridRow.change),
              DataGridCell<double>(
                  columnName: "closing", value: dataGridRow.closing),
              DataGridCell<String>(columnName: "unit", value: dataGridRow.unit),
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

class StockRegiterReportList {
  int? siNo;
  String? productname;
  String? code;
  double? openingstock;
  double? issued;
  double? changein;
  double? returnitem;
  double? sold;
  double? offloaded;
  double? change;
  double? closing;
  String? unit;
  StockRegiterReportList(
      {this.change,
      this.changein,
      this.closing,
      this.offloaded,
      this.returnitem,
      this.sold,
      this.unit,
      this.productname,
      this.issued,
      this.openingstock,
      this.code,
      this.siNo});
}

List<DropDownValueModel> customertypeitemlist = [
  const DropDownValueModel(name: 'Fresh', value: "value1"),
  const DropDownValueModel(name: 'Second', value: "value2")
];
