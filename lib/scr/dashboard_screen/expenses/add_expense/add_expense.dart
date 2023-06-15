import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:van_sales_app/widgets/custom_textfeild.dart';
import '../../../../utils/custom_colors.dart';
import 'add_expese_controller.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final AddExpenseController addExpenseController =
      Get.put(AddExpenseController());
  final String date = DateFormat("yMMMMd").format(DateTime.now());
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerPurpose = TextEditingController();
  final TextEditingController _controllerAmount = TextEditingController();
  final TextEditingController _controllerExpenseHead = TextEditingController();

  @override
  void initState() {
    {
      _controllerDate.text = date;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleOnltyCustomAppBar(
        title: "Add Expense",
        onBackTap: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: CustomTextField(
                      controller: _controllerExpenseHead,
                      text: "Expense Head")),
              Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: CustomTextField(
                      controller: _controllerPurpose, text: "Purpose")),
              Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: CustomTextField(
                      controller: _controllerAmount, text: "Amount")),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: TextField(
                  readOnly: true,
                  controller: _controllerDate,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: signinTheamColor1),
                    ),
                    label: Text('Date '),
                  ),
                ),
              ),
              //photo picker//

              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 200,
                  height: 200,
                  child: Obx(
                    () {
                      try {
                        final pickedImage = addExpenseController.image.value;
                        if (pickedImage != null) {
                          return Image.file(
                            File(pickedImage.path),
                            fit: BoxFit.cover,
                          );
                        } else {
                          return const Text('No image selected');
                        }
                      } catch (e) {
                        print('Error occurred while loading the image: $e');
                        return const Text('Error loading image');
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    addExpenseController.pickImage();
                  },
                  child: const Icon(Icons.camera_alt),
                ),
              ),
              CustomCurvedButton(
                  tittle: "Add",
                  onPressed: () {
                    addExpenseController.addExpense(
                      Shop(
                        expenseHead: _controllerExpenseHead.text,
                        purpous: _controllerPurpose.text,
                        amount: _controllerAmount.text,
                        date: _controllerDate.text,
                      ),
                    );
                    // Clear text fields
                    _controllerExpenseHead.clear();
                    _controllerPurpose.clear();
                    _controllerAmount.clear();
                  },
                  buttonheight: 40,
                  buttonwidth: 150),

              const ExpenseTable(),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpenseTable extends StatefulWidget {
  const ExpenseTable({super.key});

  @override
  State<ExpenseTable> createState() => _ExpenseTableState();
}

class _ExpenseTableState extends State<ExpenseTable> {
  final AddExpenseController addExpenseController =
      Get.put(AddExpenseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: gridBorderColor)),
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SfDataGridTheme(
          data: SfDataGridThemeData(headerColor: tableHeaderbgColor),
          child: Obx(() {
            if (!addExpenseController.isLoading.value) {
              return const Text('Loading...');
            }
            return SfDataGridTheme(
              data: SfDataGridThemeData(
                  headerColor: const Color.fromARGB(255, 232, 216, 236)),
              child: SfDataGrid(
                source:
                    ShopDataSource(addExpenseController.shopList), //_shopList,

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
                      columnName: "expenseHead",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        child: const Text(
                          "Expense Head",
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
                        alignment: Alignment.center,
                        child: const Text(
                          "date",
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
                      columnName: "purpous",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "purpous",
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
                      columnName: "amount",
                      label: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Amount .",
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
  ShopDataSource(List<Shop> shops) {
    dataGridRows = shops
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "siNO", value: dataGridRow.siNo),
              DataGridCell<String>(
                  columnName: "expenseHead", value: dataGridRow.expenseHead),
              DataGridCell<String>(columnName: "date", value: dataGridRow.date),
              DataGridCell<String>(
                  columnName: "purpous", value: dataGridRow.purpous),
              DataGridCell<double>(
                  columnName: "amount", value: dataGridRow.amount),
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
  String? expenseHead;
  String? date;
  String? purpous;
  double? amount;

  Shop({this.siNo, this.expenseHead, this.date, this.purpous, amount});

  // Vehicle.fromJson(Map<String, dynamic> json) {
  //   blockFlat = parseString(json['block_flat']);
  //   name = parseString(json['name']);
  //   noOfVehicles = parseInt(json['no_of_vehicle']);
  //   parkingSlot = parseString(json['parking_slot']);
  //   vehcleNumber = parseString(json['vehicles_no']);
}
