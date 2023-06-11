import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:van_sales_app/scr/dashboard_screen/new_order/new_order_screen/add_order/add_order_screen.dart';
import 'package:van_sales_app/scr/dashboard_screen/new_order/new_order_screen/order_report/order_report_screen.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import '../../../../utils/custom_colors.dart';
import '../../../../widgets/custom_curved_button.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'new_order_controller.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({super.key});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "New Order"),
      body: Center(
        child: Column(children: [
          CustomCurvedButton(
            tittle: "Add New",
            onPressed: () {
              Get.to(const AddOrderScreen());
            },
            buttonheight: 40,
            buttonwidth: MediaQuery.of(context).size.width * .85,
          ),
          CustomCurvedButton(
            tittle: "Upload Now",
            onPressed: () {
              const NewOrderScreen();
            },
            buttonheight: 40,
            buttonwidth: MediaQuery.of(context).size.width * .85,
          ),
          CustomCurvedButton(
            tittle: "Orde Report",
            onPressed: () {
              Get.to(const OrderReporScreen());
            },
            buttonheight: 40,
            buttonwidth: MediaQuery.of(context).size.width * .85,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: OrderTable(),
          )
        ]),
      ),
    );
  }
}

class OrderTable extends StatefulWidget {
  const OrderTable({super.key});

  @override
  State<OrderTable> createState() => _OrderTableState();
}

class _OrderTableState extends State<OrderTable> {
  final NewOrderController addExpenseController = Get.put(NewOrderController());

  // List<OrderList> _shopList = [
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
            if (!addExpenseController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: tableHeaderbgColor),
              child: SfDataGrid(
                source:
                    ShopDataSource(addExpenseController.orderList), //_shopList,

                columns: [
                  GridColumn(
                    width: MediaQuery.of(context).size.width * 0.15,
                    columnName: "siNo",
                    label: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      // ignore: prefer_const_constructors
                      child: Text(
                        "SI.No",
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          color: tableHeadereColor,
                        ),
                      ),
                    ),
                  ),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.20,
                      columnName: "orderid",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        child: const Text(
                          "Order ID ",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.15,
                      columnName: "orderno",
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
                      width: MediaQuery.of(context).size.width * 0.20,
                      columnName: "stocktype",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Stock Type",
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
                      columnName: "shift",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Shift .",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.15,
                      columnName: "date",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Date .",
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
  ShopDataSource(List<OrderList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "siNO", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "orderid", value: dataGridRow.orderid),
              DataGridCell<String>(
                  columnName: "orderno", value: dataGridRow.orderno),
              DataGridCell<String>(
                  columnName: "stocktype", value: dataGridRow.stocktype),
              DataGridCell<String>(
                  columnName: "shift", value: dataGridRow.shift),
              DataGridCell<String>(columnName: "date", value: dataGridRow.date),
            ]))
        .toList();
  }

  late List<DataGridRow> dataGridRows;
  @override
  List<DataGridRow> get rows => dataGridRows;

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

class OrderList {
  int? siNo;
  String? orderid;
  String? orderno;
  String? stocktype;
  String? shift;
  String? date;

  OrderList(
      {this.siNo,
      this.orderid,
      this.orderno,
      this.stocktype,
      this.shift,
      this.date});

  // Vehicle.fromJson(Map<String, dynamic> json) {
  //   blockFlat = parseString(json['block_flat']);
  //   name = parseString(json['name']);
  //   noOfVehicles = parseInt(json['no_of_vehicle']);
  //   parkingSlot = parseString(json['parking_slot']);
  //   vehcleNumber = parseString(json['vehicles_no']);
}
