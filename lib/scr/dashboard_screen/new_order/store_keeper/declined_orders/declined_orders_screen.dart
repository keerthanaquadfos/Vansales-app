import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';

import '../../../../../utils/custom_colors.dart';
import '../../../../../widgets/addButton.dart';
import 'declined_order_controller.dart';

class DeclinedOrderScreen extends StatelessWidget {
  const DeclinedOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TitleOnltyCustomAppBar(title: "Declined Orders"),
      body: Column(
        children: [
          Expanded(child: DeclinedOrderTable()),
        ],
      ),
    );
  }
}

class DeclinedOrderTable extends StatefulWidget {
  const DeclinedOrderTable({super.key});

  @override
  State<DeclinedOrderTable> createState() => _DeclinedOrderTableState();
}

class _DeclinedOrderTableState extends State<DeclinedOrderTable> {
  final DeclinedOrderController declinedOrderController =
      Get.put(DeclinedOrderController());

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: MediaQuery.of(context).size.height * .6,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: gridBorderColor)),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SfDataGridTheme(
          data: SfDataGridThemeData(
              headerColor: gridHeaderColor, gridLineColor: gridBorderColor),
          child: Obx(() {
            if (declinedOrderController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(
                  headerColor: const Color.fromARGB(255, 232, 216, 236)),
              child: SfDataGrid(
                source: ShopDataSource(
                    declinedOrderController.declinedOrderList), //_shopList,

                columns: [
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.10,
                      columnName: "siNo",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "SI.No",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.30,
                      columnName: "orderName",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Order Name",
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
                      columnName: "staff",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Staff",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.10,
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
                      width: MediaQuery.of(context).size.width * 0.25,
                      columnName: "details",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Details",
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
  ShopDataSource(List<DeclinedOrderList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "siNo", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "oredrName", value: dataGridRow.oredrName),
              DataGridCell<String>(
                  columnName: "staff", value: dataGridRow.staff),
              DataGridCell<String>(columnName: "date", value: dataGridRow.date),
              DataGridCell<String>(
                  columnName: "details", value: dataGridRow.details),
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
        child: dataGridCell.columnName == "details"
            ? const TableButton()
            : Text(
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

class DeclinedOrderList {
  int? siNo;
  String? oredrName;
  String? staff;
  String? date;
  String? details;

  DeclinedOrderList(
      {this.oredrName, this.details, this.staff, this.date, this.siNo});
}
