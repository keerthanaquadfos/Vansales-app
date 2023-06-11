import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/scr/dashboard_screen/add_shop/add_shop/add_shop_screen.dart';
import 'package:van_sales_app/utils/custom_colors.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../widgets/custom_drawer_widget.dart';
import 'shop_managementController.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ShopManagementScreen extends StatefulWidget {
  const ShopManagementScreen({super.key});

  @override
  State<ShopManagementScreen> createState() => _ShopManagementScreenState();
}

class _ShopManagementScreenState extends State<ShopManagementScreen> {
  final ShopManagementController shopManagementController =
      Get.put(ShopManagementController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the key to the Scaffold
      appBar: CustomAppBar(
        title: "Shops Management",
        onMenuTap: () {
          _scaffoldKey.currentState?.openDrawer(); // Open the left-side drawer
        },
        onBackTap: () {
          Get.back();
        },
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCurvedButton(
                    onPressed: () {
                      Get.to(const AddShopScreen());
                    },
                    tittle: "ADD NEW SHOP",
                    buttonheight: 40,
                    buttonwidth: 150),
                CustomCurvedButton(
                    onPressed: () {},
                    tittle: "UPLOAD",
                    buttonheight: 40,
                    buttonwidth: 150),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: gridBorderColor)),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: SfDataGridTheme(
                  data: SfDataGridThemeData(
                      headerColor: gridHeaderColor,
                      gridLineColor: gridBorderColor),
                  child: Obx(() {
                    if (shopManagementController.isLoding.isTrue) {
                      return const Text('Loding...');
                    }

                    return SfDataGridTheme(
                      data: SfDataGridThemeData(
                          headerColor:
                              const Color.fromARGB(255, 232, 216, 236)),
                      child: SfDataGrid(
                        source: ShopDataSource(
                            shopManagementController.getListedVehicle),
                        columns: [
                          GridColumn(
                            width: MediaQuery.of(context).size.width * 0.15,
                            columnName: "siNo",
                            label: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                              columnName: "shopName",
                              label: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Shop",
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
                              columnName: "address",
                              label: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Address",
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "Status",
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
                              columnName: "mobileNo",
                              label: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  "Mobile No.",
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
            ),
          )
        ],
      ),
    );
  }
}

class ShopDataSource extends DataGridSource {
  ShopDataSource(List<Shop> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(
                  columnName: "blockFlat", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "name", value: dataGridRow.shopNmane),
              DataGridCell<String>(
                  columnName: "noOfVehicles", value: dataGridRow.address),
              DataGridCell<String>(
                  columnName: "parkingSlot", value: dataGridRow.status),
              DataGridCell<String>(
                  columnName: "vehcleNumber", value: dataGridRow.mobileNo),
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

class Shop {
  int? siNo;
  String? shopNmane;
  String? address;
  String? status;
  String? mobileNo;

  Shop({this.siNo, this.shopNmane, this.address, this.status, mobileNo});

  // Vehicle.fromJson(Map<String, dynamic> json) {
  //   blockFlat = parseString(json['block_flat']);
  //   name = parseString(json['name']);
  //   noOfVehicles = parseInt(json['no_of_vehicle']);
  //   parkingSlot = parseString(json['parking_slot']);
  //   vehcleNumber = parseString(json['vehicles_no']);
}
