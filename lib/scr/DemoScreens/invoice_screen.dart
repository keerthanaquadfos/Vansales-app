import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';

import '../../utils/custom_colors.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "VanSales"),
      body: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(bottom: 10),
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width * 1.0, // 75% height of screen
        decoration: const BoxDecoration(
          color: dashAppBarColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                "Tax Invoice",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "INV NO : 1012/23",
                      style: TextStyle(
                          color: taxInvoiceTextGrayColor, fontSize: 18),
                    ),
                    Text(
                      "Date : 30/05/2023",
                      style: TextStyle(
                          color: taxInvoiceTextGrayColor, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const Expanded(child: InvoiceTable()),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 2,
                width: MediaQuery.of(context).size.width * 1,
                color: Colors.black,
              ),
              const Text(
                "Whether the tax is payable on reverse charge basis: NO Certified that all particulars shown in the above tax invoice are true and correct. We here by voluntarily forego any actionable claim or enforceable right in respect to brand name printed on the bag.",
                textAlign: TextAlign.justify,
                style: TextStyle(color: taxInvoiceTextGrayColor),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 2,
                width: MediaQuery.of(context).size.width * 1,
                color: Colors.black,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "VANSALES LLC.",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomCurvedButton(
                  onPressed: () {},
                  buttonheight: 40,
                  buttonwidth: .3,
                  tittle: "Download",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InvoiceTable extends StatefulWidget {
  const InvoiceTable({super.key});

  @override
  State<InvoiceTable> createState() => _InvoiceTableState();
}

class _InvoiceTableState extends State<InvoiceTable> {
  final InvoiceController invoiceController = Get.put(InvoiceController());

  @override
  Widget build(BuildContext context) {
    return Container(
//height: MediaQuery.of(context).size.height * .55,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: dashAppBarColor)),
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: SfDataGridTheme(
          data: SfDataGridThemeData(
              headerColor: gridHeaderColor, gridLineColor: dashAppBarColor),
          child: Obx(() {
            if (invoiceController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: dashAppBarColor),
              child: SfDataGrid(
                source:
                    ShopDataSource(invoiceController.invoiceList), //_shopList,

                tableSummaryRows: [
                  GridTableSummaryRow(
                      color: dashAppBarColor,
                      showSummaryInRow: false,
                      title: "Total :",
                      columns: [
                        const GridSummaryColumn(
                            name: 'qty',
                            columnName: 'qty',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'tval',
                            columnName: 'tval',
                            summaryType: GridSummaryType.sum),
                      ],
                      position: GridTableSummaryRowPosition.bottom),
                  GridTableSummaryRow(
                      color: dashAppBarColor,
                      showSummaryInRow: true,
                      title: "Total TAX: 108.5",
                      columns: [],
                      position: GridTableSummaryRowPosition.bottom),
                  GridTableSummaryRow(
                      color: dashAppBarColor,
                      showSummaryInRow: true,
                      title: "Grand Total : 2278.5",
                      columns: [],
                      position: GridTableSummaryRowPosition.bottom),
                ],

                columns: [
                  GridColumn(
                      width: MediaQuery.of(context).size.width * 0.15,
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
                      width: MediaQuery.of(context).size.width * 0.18,
                      columnName: "item",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "ITEM",
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
                      columnName: "qty",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "QTY ",
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
                      columnName: "rate",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "RATE",
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
                      columnName: "tax",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "TAX%",
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
                      columnName: "tval",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "T-VAL",
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
  ShopDataSource(List<InvoiceList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "si_no", value: dataGridRow.siNo),
              DataGridCell<String>(columnName: "item", value: dataGridRow.item),
              DataGridCell<double>(columnName: "qty", value: dataGridRow.qty),
              DataGridCell<double>(columnName: "rate", value: dataGridRow.rate),
              DataGridCell<double>(columnName: "tax", value: dataGridRow.tax),
              DataGridCell<double>(columnName: "tval", value: dataGridRow.tval),
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
    Color getRowBackgroundColor() {
      final int index = effectiveRows.indexOf(row);
      if (index % 2 != 0) {
        return Colors.white!;
      }

      return Colors.transparent;
    }

    return DataGridRowAdapter(
        color: getRowBackgroundColor(), //,dashAppBarColor
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

class InvoiceList {
  int? siNo;
  String? item;
  double? qty;
  double? rate;
  double? tax;
  double? tval;

  InvoiceList({this.item, this.tax, this.rate, this.qty, this.tval, this.siNo});
}

//////////////////////////////////////////////////////////////////
class InvoiceController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<InvoiceList> _invoiceList = <InvoiceList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _invoiceList.addAll([
      InvoiceList(
          item: "product 1", qty: 8, rate: 10.00, tax: 5.00, tval: 80.0),
      InvoiceList(
          item: "product 1", qty: 4, rate: 20.00, tax: 5.00, tval: 80.0),
      InvoiceList(
          item: "product 3", qty: 10, rate: 5.00, tax: 5.00, tval: 50.0),
      InvoiceList(
          item: "product 4", qty: 14, rate: 15.00, tax: 5.00, tval: 210.0),
      InvoiceList(
          item: "product 5", qty: 40, rate: 25.00, tax: 5.00, tval: 1000.0),
      InvoiceList(
          item: "product 6", qty: 25, rate: 30.00, tax: 5.00, tval: 750.0),
    ]);
    isLoading.value = false;
  }

  List<InvoiceList> get invoiceList => _invoiceList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
