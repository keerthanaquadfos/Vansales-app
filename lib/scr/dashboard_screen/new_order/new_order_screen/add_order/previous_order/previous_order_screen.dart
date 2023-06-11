import 'package:flutter/material.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../../../utils/custom_colors.dart';
import 'previous_order_controller.dart';

class PreviousOrderScreen extends StatefulWidget {
  const PreviousOrderScreen({super.key});

  @override
  State<PreviousOrderScreen> createState() => _PreviousOrderScreenState();
}

class _PreviousOrderScreenState extends State<PreviousOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TitleOnltyCustomAppBar(title: "Sales Previous Order"),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        OrderTable()
      ]),
    );
  }
}

/////////
class OrderTable extends StatefulWidget {
  const OrderTable({super.key});

  @override
  State<OrderTable> createState() => _OrderTableState();
}

class _OrderTableState extends State<OrderTable> {
  final PreviousOrderController previousOrderController =
      Get.put(PreviousOrderController());

  // List<PreviousOrderList> _shopList = [
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
            if (previousOrderController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(
                  headerColor: const Color.fromARGB(255, 232, 216, 236)),
              child: SfDataGrid(
                source: ShopDataSource(
                    previousOrderController.previousOrderList), //_shopList,

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
                      width: MediaQuery.of(context).size.width * 0.40,
                      columnName: "getPreviousOrderDetails",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Get Previous Order Details .",
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
  ShopDataSource(List<PreviousOrderList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "siNO", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "orderno", value: dataGridRow.orderno),
              DataGridCell<String>(columnName: "date", value: dataGridRow.date),
              DataGridCell<String>(
                  columnName: "getPreviousOrderDetails",
                  value: dataGridRow.getPreviousOrderDetails),
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
        child: dataGridCell.columnName == "getPreviousOrderDetails"
            ? ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(signinTheamColor1),
                ),
                onPressed: () {
                  // Button action for the "Date" column
                },
                child: Text(
                  dataGridCell.value.toString(),
                  style: const TextStyle(
                    fontFamily: "poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: bottumnavigationWhite,
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

class PreviousOrderList {
  int? siNo;

  String? orderno;

  String? date;
  String? getPreviousOrderDetails;

  PreviousOrderList(
      {this.siNo, this.orderno, this.getPreviousOrderDetails, this.date});

  // Vehicle.fromJson(Map<String, dynamic> json) {
  //   blockFlat = parseString(json['block_flat']);
  //   name = parseString(json['name']);
  //   noOfVehicles = parseInt(json['no_of_vehicle']);
  //   parkingSlot = parseString(json['parking_slot']);
  //   vehcleNumber = parseString(json['vehicles_no']);
}
