import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';

import '../../../utils/custom_colors.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_dropdown.dart';
import 'van_stock_controller.dart';

class VanStockScreen extends StatefulWidget {
  const VanStockScreen({super.key});

  @override
  State<VanStockScreen> createState() => _VanStockScreenState();
}

class _VanStockScreenState extends State<VanStockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Van Stock "),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustemDropdown(
              texthint: "Stock Type",
              boxwidth: MediaQuery.of(context).size.width * 1,
              itemcount: 3,
              itemlist: vanStocTtype,
            ),
          ),
          const Expanded(child: VanStockTable()),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomCurvedButton(
                onPressed: () {},
                buttonheight: 40,
                tittle: "Print",
                buttonwidth: MediaQuery.of(context).size.width * 1),
          )
        ],
      ),
    );
  }
}

class VanStockTable extends StatefulWidget {
  const VanStockTable({super.key});

  @override
  State<VanStockTable> createState() => _VanStockTableState();
}

class _VanStockTableState extends State<VanStockTable> {
  final VanStockController vanStockController = Get.put(VanStockController());

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
            if (vanStockController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: tableHeaderbgColor),
              child: SfDataGrid(
                source: ShopDataSource(
                    vanStockController.vanStockList), //_shopList,

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
                            name: 'changein',
                            columnName: 'changein',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'received',
                            columnName: 'received',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'sold',
                            columnName: 'sold',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'change',
                            columnName: 'change',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'offloaded',
                            columnName: 'offloaded',
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
                      columnName: "code",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Product Code ",
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
                      columnName: "received",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Received",
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
                      columnName: "closing",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Closing Stock",
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
  ShopDataSource(List<VanStockList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "si_no", value: dataGridRow.siNo),
              DataGridCell<String>(columnName: "code", value: dataGridRow.code),
              DataGridCell<String>(
                  columnName: "productname", value: dataGridRow.productname),
              DataGridCell<double>(
                  columnName: "openingstock", value: dataGridRow.openingstock),
              DataGridCell<double>(
                  columnName: "received", value: dataGridRow.received),
              DataGridCell<double>(columnName: "sold", value: dataGridRow.sold),
              DataGridCell<double>(
                  columnName: "change", value: dataGridRow.change),
              DataGridCell<double>(
                  columnName: "offloaded", value: dataGridRow.offloaded),
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

class VanStockList {
  int? siNo;
  String? productname;
  String? code;
  double? openingstock;

  double? received;
  double? sold;
  double? offloaded;
  double? change;
  double? closing;
  String? unit;
  VanStockList(
      {this.change,
      this.closing,
      this.offloaded,
      this.received,
      this.sold,
      this.unit,
      this.productname,
      this.openingstock,
      this.code,
      this.siNo});
}

List<DropDownValueModel> vanStocTtype = [
  const DropDownValueModel(name: 'Fresh', value: "value1"),
  const DropDownValueModel(name: 'Second', value: "value2"),
  const DropDownValueModel(name: 'Damaged', value: "value2")
];
