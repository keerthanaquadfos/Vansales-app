import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:van_sales_app/utils/custom_colors.dart';
import 'package:van_sales_app/widgets/custom_textfeild.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_curved_button.dart';
import '../../../widgets/custom_dropdown.dart';
import 'offload_controller.dart';
import 'previous_offload/previous_offload_screen.dart';

class OffloadScreen extends StatefulWidget {
  const OffloadScreen({super.key});

  @override
  State<OffloadScreen> createState() => _OffloadScreenState();
}

class _OffloadScreenState extends State<OffloadScreen> {
  final OffloadController offloadController = Get.put(OffloadController());
  // final Rx<TextEditingController> _controllerBarcodeScan =
  //     TextEditingController().obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Offload "),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                CustomCurvedButton(
                    tittle: "Preious",
                    onPressed: () {
                      Get.to(const PreviousOffloadScreen());
                    },
                    buttonheight: 40,
                    buttonwidth: .95),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFielBox(
                    controller: offloadController.barcodeController,
                    text: "Scan Barcode"),
                ElevatedButton(
                  onPressed: () {
                    offloadController.scanBarcode();
                  },
                  child: const Text('Scan Barcode'),
                ),
                CustemDropdown(
                  texthint: "Stock Type",
                  boxwidth: 1,
                  itemcount: 3,
                  itemlist: stockType,
                ),
                CustomCurvedButton(
                    tittle: "Summary",
                    onPressed: () {},
                    buttonheight: 40,
                    buttonwidth: .95),
              ],
            ),
          ),
          const OffloadTable(),
        ],
      ),
    );
  }
}

class OffloadTable extends StatefulWidget {
  const OffloadTable({super.key});

  @override
  State<OffloadTable> createState() => _OffloadTableState();
}

class _OffloadTableState extends State<OffloadTable> {
  final OffloadController offloadController = Get.put(OffloadController());

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
            if (offloadController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: tableHeaderbgColor),
              child: SfDataGrid(
                source: ShopDataSource(
                    offloadController.ooffloadeList), //_shopList,

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
                      columnName: "product",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Product",
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
                      columnName: "expDate",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Exp.Date ",
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
                      columnName: "barcode",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Barcode",
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
                      columnName: "stock",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Stock ",
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
                          "Unit ",
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
                      columnName: "addedQuantity",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Added Qty",
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
                      columnName: "status",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
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
                ],
              ),
            );
          })),
    );
  }
}

class ShopDataSource extends DataGridSource {
  ShopDataSource(List<OffloadeList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "si_no", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "product", value: dataGridRow.product),
              DataGridCell<String>(
                  columnName: "expDate", value: dataGridRow.expDate),
              DataGridCell<String>(
                  columnName: "barcode", value: dataGridRow.barcode),
              DataGridCell<double>(
                  columnName: "stock", value: dataGridRow.stock),
              DataGridCell<String>(columnName: "unit", value: dataGridRow.unit),
              DataGridCell<double>(
                  columnName: "addedQuantity",
                  value: dataGridRow.addedQuantity),
              DataGridCell<String>(
                  columnName: "status", value: dataGridRow.status),
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

class OffloadeList {
  int? siNo;
  String? product;
  String? expDate;
  String? barcode;
  double? stock;
  String? unit;
  double? addedQuantity;
  String? status;
  OffloadeList(
      {this.addedQuantity,
      this.unit,
      this.barcode,
      this.expDate,
      this.product,
      this.status,
      this.stock,
      this.siNo});
}

final List<DropDownValueModel> stockType = [
  const DropDownValueModel(
    name: "Fresh",
    value: "fresh",
  ),
  const DropDownValueModel(
    name: "Seconds",
    value: "Seconds",
  ),
  const DropDownValueModel(
    name: "Damaged",
    value: "damaged",
  )
];
