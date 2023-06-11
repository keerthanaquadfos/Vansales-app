import 'package:flutter/material.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';
import 'package:van_sales_app/widgets/datepickertextfeild.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../../../utils/custom_colors.dart';
import 'package:get/get.dart';

import 'order_report_controller.dart';

class OrderReporScreen extends StatefulWidget {
  const OrderReporScreen({super.key});

  @override
  State<OrderReporScreen> createState() => _OrderReporScreenState();
}

class _OrderReporScreenState extends State<OrderReporScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Order Report"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const DatePickerTextField(labelText: "From Date"),
                const DatePickerTextField(labelText: "To Date"),
                CustomCurvedButton(
                    tittle: "LOAD",
                    onPressed: () {},
                    buttonheight: 40,
                    buttonwidth: MediaQuery.of(context).size.width * .95),
              ],
            ),
          ),
          const OrderReportTable(),
        ],
      ),
    );
  }
}

class OrderReportTable extends StatefulWidget {
  const OrderReportTable({super.key});

  @override
  State<OrderReportTable> createState() => _OrderReportTableState();
}

class _OrderReportTableState extends State<OrderReportTable> {
  final OrderReportController orderReportController =
      Get.put(OrderReportController());

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
            if (orderReportController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(
                  headerColor: const Color.fromARGB(255, 232, 216, 236)),
              child: SfDataGrid(
                source: ShopDataSource(
                    orderReportController.orderReportList), //_shopList,

                tableSummaryRows: [
                  GridTableSummaryRow(
                      showSummaryInRow: false,
                      columns: [
                        const GridSummaryColumn(
                            name: 'quantity',
                            columnName: 'quantity',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'amount',
                            columnName: 'amount',
                            summaryType: GridSummaryType.sum)
                      ],
                      position: GridTableSummaryRowPosition.bottom)
                ],

                columns: [
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.20,
                      columnName: "date",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "    Date .",
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
                      columnName: "itemcode",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Order NO",
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
                      columnName: "itemname",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Item Name .",
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
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.40,
                      columnName: "quantity",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Quantity",
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
                      columnName: "rate",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Rate",
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
                      columnName: "amount",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Amount",
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
  ShopDataSource(List<OrderReportList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(columnName: "date", value: dataGridRow.date),
              DataGridCell<String>(
                  columnName: "itemcode", value: dataGridRow.itemcode),
              DataGridCell<String>(
                  columnName: "itemname", value: dataGridRow.itemname),
              DataGridCell<String>(columnName: "unit", value: dataGridRow.unit),
              DataGridCell<double>(
                  columnName: "quantity", value: dataGridRow.quantity),
              DataGridCell<double>(columnName: "rate", value: dataGridRow.rate),
              DataGridCell<double>(
                  columnName: "amount", value: dataGridRow.amount),
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

class OrderReportList {
  String? date;
  String? itemcode;
  String? itemname;
  String? unit;
  double? quantity;
  double? rate;
  double? amount;

  OrderReportList(
      {this.itemcode,
      this.itemname,
      this.amount,
      this.quantity,
      this.rate,
      this.unit,
      this.date});

  // Vehicle.fromJson(Map<String, dynamic> json) {
  //   blockFlat = parseString(json['block_flat']);
  //   name = parseString(json['name']);
  //   noOfVehicles = parseInt(json['no_of_vehicle']);
  //   parkingSlot = parseString(json['parking_slot']);
  //   vehcleNumber = parseString(json['vehicles_no']);
}
