import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/scr/dashboard_screen/add_shop/add_shop/add_shop_screen.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';
import '../../../utils/custom_colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'show_client_controller.dart';

class ShowClientScreen extends StatefulWidget {
  const ShowClientScreen({super.key});

  @override
  State<ShowClientScreen> createState() => _ShowClientScreenState();
}

class _ShowClientScreenState extends State<ShowClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Show Clients"),
      body: Column(
        children: [
          //CustomSearchbar(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomCurvedButton(
              onPressed: (() => Get.to(const AddShopScreen())),
              buttonheight: 40,
              buttonwidth: 1,
              tittle: "Add Shop",
            ),
          ),
          const ClientTable(),
        ],
      ),
    );
  }
}

class ClientTable extends StatefulWidget {
  const ClientTable({super.key});

  @override
  State<ClientTable> createState() => _ClientTableState();
}

class _ClientTableState extends State<ClientTable> {
  final ShowClientController showClientController =
      Get.put(ShowClientController());

  // List<Shop> _shopList = [
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height * .8,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: gridBorderColor)),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: SfDataGridTheme(
          data: SfDataGridThemeData(
              headerColor: gridHeaderColor, gridLineColor: gridBorderColor),
          child: Obx(() {
            if (!showClientController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: tableHeaderbgColor),
              child: SfDataGrid(
                source:
                    ShopDataSource(showClientController.shopList), //_shopList,

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
                      columnName: "shopcode",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        child: const Text(
                          "Shop Code",
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
                      columnName: "shopname",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Shop Name",
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
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
                      width: MediaQuery.of(context).size.width * 0.30,
                      columnName: "clientcategory",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "category .",
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
                      columnName: "moobile",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Mobile .",
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
                      columnName: "route",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Route .",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: tableHeadereColor,
                          ),
                        ),
                      )),
                  // GridColumn(
                  //     width: MediaQuery.of(context).size.width * 0.30,
                  //     columnName: ".",
                  //     label: Container(
                  //       padding: const EdgeInsets.symmetric(horizontal: 16),
                  //       alignment: Alignment.centerLeft,
                  //       child: const Text(
                  //         ". .",
                  //         overflow: TextOverflow.clip,
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.w500,
                  //           fontSize: 10,
                  //           color: tableHeadereColor,
                  //         ),
                  //       ),
                  //     )),
                ],
              ),
            );
          })),
    );
  }
}

class ShopDataSource extends DataGridSource {
  ShopDataSource(List<ClientList> clients) {
    dataGridRows = clients
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "siNO", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "shopcode", value: dataGridRow.shopcode),
              DataGridCell<String>(
                  columnName: "shopname", value: dataGridRow.shopname),
              DataGridCell<String>(
                  columnName: "address", value: dataGridRow.address),
              DataGridCell<String>(
                  columnName: "clientcategory",
                  value: dataGridRow.clientcategory),
              DataGridCell<String>(
                  columnName: "mobile", value: dataGridRow.mobile),
              DataGridCell<String>(
                  columnName: "route", value: dataGridRow.route),
              // DataGridCell<double>(
              // columnName: "*", value: dataGridRow.*),
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

class ClientList {
  int? siNo;
  String? shopcode;
  String? shopname;
  String? address;
  String? clientcategory;
  String? mobile;
  String? route;

  ClientList(
      {this.siNo,
      this.shopcode,
      this.shopname,
      this.address,
      this.clientcategory,
      this.mobile,
      this.route});

  // Vehicle.fromJson(Map<String, dynamic> json) {
  //   blockFlat = parseString(json['block_flat']);
  //   name = parseString(json['name']);
  //   noOfVehicles = parseInt(json['no_of_vehicle']);
  //   parkingSlot = parseString(json['parking_slot']);
  //   vehcleNumber = parseString(json['vehicles_no']);
}
