import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/scr/dashboard_screen/new_order/new_order_screen/add_order/previous_order/previous_order_screen.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../../../utils/custom_colors.dart';
import '../../../../../widgets/addButton.dart';
import '../../../../../widgets/custom_app_bar.dart';
import '../../../../../widgets/datepickertextfeild.dart';
import '../../../../../widgets/dropdown_order.dart';
import 'add_order_controller.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchOnltyCustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                const DatePickerTextField(
                  labelText: "Enter Date",
                ),
                const DropDownOrder(),
                CustomCurvedButton(
                    tittle: "Previous Orders",
                    onPressed: () {
                      Get.to(const PreviousOrderScreen());
                    },
                    buttonheight: 40,
                    buttonwidth: MediaQuery.of(context).size.width * 1),
                const OrderTable(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////

class OrderTable extends StatefulWidget {
  const OrderTable({super.key});

  @override
  State<OrderTable> createState() => _OrderTableState();
}

class _OrderTableState extends State<OrderTable> {
  final AddOrderController addOrderController = Get.put(AddOrderController());

  // List<ItemList> _shopList = [
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
            if (addOrderController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(
                  headerColor: const Color.fromARGB(255, 232, 216, 236)),
              child: SfDataGrid(
                source:
                    ShopDataSource(addOrderController.itemList), //_shopList,

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
                      columnName: "vanstock",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Vanstock ",
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
                      columnName: "add",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Add .",
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
                      columnName: "remove",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Remove .",
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
                      columnName: "status",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "..",
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
  ShopDataSource(List<ItemList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "siNO", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "productname", value: dataGridRow.productname),
              DataGridCell<double>(
                  columnName: "vanstock", value: dataGridRow.vanstock),
              DataGridCell<int>(
                  columnName: "qtyneeded", value: dataGridRow.qtyneeded),
              DataGridCell<String>(columnName: "add", value: dataGridRow.add),
              DataGridCell<String>(
                  columnName: "remove", value: dataGridRow.remove),
              DataGridCell<String>(
                  columnName: "status", value: dataGridRow.status),
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
        child: dataGridCell.columnName == "qtyneeded"
            ? const TextField(
                // controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey, // Set the border color
                      width: 1.0, // Set the border width
                    ),
                  ),

                  // enabledBorder: const UnderlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.black12),
                  // ),
                  // focusedBorder: const UnderlineInputBorder(
                  //   borderSide: BorderSide(color: signinTheamColor1),
                  // ),
                  // label: Text(
                  //   dataGridCell.value.toString(),
                  // ),
                ),
              )
            : dataGridCell.columnName == "add"
                ? const AddButton()
                : dataGridCell.columnName == "remove"
                    ? const RemoveButton()
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

class ItemList {
  int? siNo;
  String? productname;
  double? vanstock;
  int? qtyneeded;
  String? add;
  String? remove;
  String? status;

  ItemList(
      {this.siNo,
      this.productname,
      this.vanstock,
      this.qtyneeded,
      this.add,
      this.status,
      this.remove});

  // Vehicle.fromJson(Map<String, dynamic> json) {
  //   blockFlat = parseString(json['block_flat']);
  //   name = parseString(json['name']);
  //   noOfVehicles = parseInt(json['no_of_vehicle']);
  //   parkingSlot = parseString(json['parking_slot']);
  //   vehcleNumber = parseString(json['vehicles_no']);
}
