import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';
import 'package:van_sales_app/widgets/datepickertextfeild.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../widgets/custom_dropdown.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../../../utils/custom_colors.dart';
import 'package:get/get.dart';

import 'category_report_controller.dart';

class CategoryReportScreen extends StatefulWidget {
  const CategoryReportScreen({super.key});

  @override
  State<CategoryReportScreen> createState() => _CategoryReportScreenState();
}

class _CategoryReportScreenState extends State<CategoryReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Item/ Category Report"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const DatePickerTextField(labelText: "From Date"),
                const DatePickerTextField(labelText: "To Date"),
                CustemDropdown(
                  texthint: "Select Report",
                  boxwidth: MediaQuery.of(context).size.width * 1,
                  itemcount: 3,
                  itemlist: reportitemlist,
                ),
                CustemDropdown(
                  texthint: "Sales Type",
                  boxwidth: MediaQuery.of(context).size.width * 1,
                  itemcount: 3,
                  itemlist: typeitemlist,
                ),
                CustomCurvedButton(
                    tittle: "Submit",
                    onPressed: () {},
                    buttonheight: 40,
                    buttonwidth: MediaQuery.of(context).size.width * 1)
              ],
            ),
          ),
          const CategoryReportTable()
        ],
      ),
    );
  }
}

class CategoryReportTable extends StatefulWidget {
  const CategoryReportTable({super.key});

  @override
  State<CategoryReportTable> createState() => _CategoryReportTableState();
}

class _CategoryReportTableState extends State<CategoryReportTable> {
  final CategoryReportController categoryReportController =
      Get.put(CategoryReportController());
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
            if (categoryReportController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(headerColor: tableHeaderbgColor),
              child: SfDataGrid(
                source: ShopDataSource(
                    categoryReportController.categoryReportList), //_shopList,

                tableSummaryRows: [
                  GridTableSummaryRow(
                      color: tableHeaderbgColor,
                      showSummaryInRow: true,
                      title: "Total :",
                      columns: [
                        const GridSummaryColumn(
                            name: 'debit',
                            columnName: 'debit',
                            summaryType: GridSummaryType.sum),
                        const GridSummaryColumn(
                            name: 'credit',
                            columnName: 'credit',
                            summaryType: GridSummaryType.sum)
                      ],
                      position: GridTableSummaryRowPosition.bottom),
                ],

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
                      columnName: "itemcode",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Item Code",
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
                      columnName: "itemname",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Item Name ",
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
                      columnName: "baseunit",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Base Unit",
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
                      columnName: "qty",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Quantity",
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
                      columnName: "altunit",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Alt Unit",
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
                      columnName: "weight",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Weight",
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
                      columnName: "amount",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: const Text(
                          "Amount",
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
  ShopDataSource(List<CategoryReportList> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "si_no", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "itemcode", value: dataGridRow.itemcode),
              DataGridCell<String>(
                  columnName: "itemname", value: dataGridRow.itemname),
              DataGridCell<String>(
                  columnName: "baseunt", value: dataGridRow.baseunt),
              DataGridCell<double>(columnName: "qty", value: dataGridRow.qty),
              DataGridCell<String>(
                  columnName: "altUnit", value: dataGridRow.altUnit),
              DataGridCell<double>(
                  columnName: "weight", value: dataGridRow.weight),
              DataGridCell<double>(
                  columnName: "amount", value: dataGridRow.amount),
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

class CategoryReportList {
  int? siNo;
  String? itemcode;
  String? itemname;
  String? baseunt;
  String? altUnit;
  double? qty;
  double? weight;
  double? amount;

  CategoryReportList(
      {this.altUnit,
      this.amount,
      this.baseunt,
      this.itemcode,
      this.itemname,
      this.qty,
      this.siNo});
}

List<DropDownValueModel> reportitemlist = [
  const DropDownValueModel(name: 'Report1', value: "value1"),
  const DropDownValueModel(name: 'Report2', value: "value2")
];
List<DropDownValueModel> typeitemlist = [
  const DropDownValueModel(name: 'All', value: "value1"),
  const DropDownValueModel(name: 'Credit', value: "value2")
];
