import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:van_sales_app/widgets/custom_dropdown.dart';

import '../../../utils/custom_colors.dart';
import '../../../widgets/addButton.dart';
import 'products_controller.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Products"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                CustemDropdown(
                    boxwidth: 1,
                    texthint: "Select Category",
                    itemcount: 4,
                    itemlist: categoryList),
                CustemDropdown(
                    boxwidth: 1,
                    texthint: "Price Group",
                    itemcount: 4,
                    itemlist: priceGroupList),
              ],
            ),
          ),
          const Expanded(child: _ProductTablState()),
        ],
      ),
    );
  }
}

class _ProductTablState extends StatefulWidget {
  const _ProductTablState({super.key});

  @override
  State<_ProductTablState> createState() => __ProductTablStateState();
}

class __ProductTablStateState extends State<_ProductTablState> {
  final ProductsController productsController = Get.put(ProductsController());
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * .5,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: gridBorderColor)),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SfDataGridTheme(
          data: SfDataGridThemeData(
              headerColor: gridHeaderColor, gridLineColor: gridBorderColor),
          child: Obx(() {
            if (productsController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: tableHeaderbgColor),
              child: SfDataGrid(
                source:
                    ShopDataSource(productsController.productList), //_shopList,

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
                      columnName: "productName",
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
                      width: MediaQuery.of(context).size.width * 0.30,
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
                      width: MediaQuery.of(context).size.width * 0.25,
                      columnName: "code",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Code",
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
  ShopDataSource(List<ProductList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "si_no", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "productName", value: dataGridRow.productName),
              DataGridCell<double>(columnName: "rate", value: dataGridRow.rate),
              DataGridCell<String>(columnName: "code", value: dataGridRow.code),
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
            ? const DetailsButton()
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

class ProductList {
  int? siNo;
  String? productName;

  double? rate;

  String? code;
  String? details;
  ProductList(
      {this.code, this.details, this.productName, this.rate, this.siNo});
}

List<DropDownValueModel> categoryList = [
  const DropDownValueModel(name: "All", value: "all"),
  const DropDownValueModel(name: "Frozen ", value: "frozen "),
  const DropDownValueModel(name: "Fresh Food", value: "Fresh"),
  const DropDownValueModel(name: "Raw Materials", value: "rawmaterials")
];
List<DropDownValueModel> priceGroupList = [
  const DropDownValueModel(name: "3 STAR", value: "3"),
  const DropDownValueModel(name: "4 STAR", value: "4"),
  const DropDownValueModel(name: "5 STAR", value: "5"),
  const DropDownValueModel(name: "6 STAR", value: "6"),
  const DropDownValueModel(name: "7 STAR", value: "7"),
  const DropDownValueModel(name: "8 STAR", value: "8"),
  const DropDownValueModel(name: "9 STAR", value: "9"),
];
