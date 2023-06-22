import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';

import '../../../../../../utils/custom_colors.dart';
import 'order_details_controller.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Order Details"),
      body: Column(
        children: [
          const Expanded(child: OrderDetailsTable()),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomCurvedButton(
                  onPressed: () {},
                  buttonheight: 40,
                  buttonwidth: .3,
                  tittle: "Release",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

///////////////////////////////////

class OrderDetailsTable extends StatefulWidget {
  const OrderDetailsTable({super.key});

  @override
  State<OrderDetailsTable> createState() => _OrderDetailsTableState();
}

class _OrderDetailsTableState extends State<OrderDetailsTable> {
  final OrderDetailsController orderDetailsController =
      Get.put(OrderDetailsController());

  // List<ItemList> _shopList = [
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * .6,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 247, 242, 248),
          border: Border.all(width: 1, color: gridBorderColor)),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SfDataGridTheme(
          data: SfDataGridThemeData(
              headerColor: gridHeaderColor, gridLineColor: gridBorderColor),
          child: Obx(() {
            if (orderDetailsController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(
                  headerColor: const Color.fromARGB(255, 232, 216, 236)),
              child: SfDataGrid(
                source: ShopDataSource(
                    orderDetailsController.orderDetailsItemList), //_shopList,

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
                      width: MediaQuery.of(context).size.width * 0.40,
                      columnName: "productname",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        child: const Text(
                          "Product Name ",
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
                      columnName: "qtyneeded",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Qty Needed",
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
                      columnName: "qtyReleased",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Qty Released ",
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
  ShopDataSource(List<OrderDetailsItemList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "siNO", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "productname", value: dataGridRow.productname),
              DataGridCell<int>(
                  columnName: "qtyneeded", value: dataGridRow.qtyneeded),
              DataGridCell<int>(
                  columnName: "qtyReleased", value: dataGridRow.qtyReleased),
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
        child: dataGridCell.columnName == "qtyReleased"
            ? const Padding(
                padding: EdgeInsets.all(3.0),
                child: TextField(
                  // controller: controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey, // Set the border color
                        width: 1.0, // Set the border width
                      ),
                    ),
                  ),
                ),
              )
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

class OrderDetailsItemList {
  int? siNo;
  String? productname;
  int? qtyneeded;
  int? qtyReleased;

  OrderDetailsItemList(
      {this.siNo, this.productname, this.qtyneeded, this.qtyReleased});
}
