import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';
import 'package:van_sales_app/widgets/custom_textfeild.dart';
import 'package:van_sales_app/widgets/datepickertextfeild.dart';

import '../../../../widgets/custom_dropdown.dart';

class AddDepositScreen extends StatefulWidget {
  const AddDepositScreen({super.key});

  @override
  State<AddDepositScreen> createState() => _AddDepositScreenState();
}

class _AddDepositScreenState extends State<AddDepositScreen> {
  double? cashInhand = 0.00;

  final TextEditingController _controllerAmount = TextEditingController();

  final TextEditingController _controllerBranchName = TextEditingController();

  final TextEditingController _controllerBranchCode = TextEditingController();

  final TextEditingController _controllerDiscription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Add Deposit"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Cash in Hand :$cashInhand ",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              CustemDropdown(
                texthint: "Pay Mode",
                boxwidth: 1,
                itemcount: 4,
                itemlist: payModeList,
              ),
              const DatePickerTextField(labelText: "Date"),
              CustomTextFieldOnlyNumber(
                  controller: _controllerAmount, text: "Aomunt"),
              CustemDropdown(
                texthint: "Select Type",
                boxwidth: 1,
                itemcount: 4,
                itemlist: typeList,
              ),
              CustemDropdown(
                texthint: "Select Bank ",
                boxwidth: 1,
                itemcount: 10,
                itemlist: bankList,
              ),
              CustomTextField(
                  controller: _controllerBranchName, text: "Branch Name"),
              CustomTextField(
                  controller: _controllerBranchCode, text: "Branch Code"),
              const SizedBox(
                height: 10,
              ),
              LargeCustomTextField(
                  controller: _controllerDiscription, text: "Discription"),
              const SizedBox(
                height: 10,
              ),
              CustomCurvedButton(
                  tittle: "Save",
                  onPressed: () {},
                  buttonheight: 50,
                  buttonwidth: 1)
            ],
          ),
        ),
      ),
    );
  }
}

List<DropDownValueModel> payModeList = [
  const DropDownValueModel(name: "Cash", value: "cash"),
  const DropDownValueModel(name: "cheque ", value: "cheque "),
  const DropDownValueModel(name: "Gpay", value: "gpay"),
  const DropDownValueModel(name: "Net Banking", value: "netbank")
];
List<DropDownValueModel> typeList = [
  const DropDownValueModel(name: "Cash", value: "cash"),
  const DropDownValueModel(name: "cheque ", value: "cheque "),
  const DropDownValueModel(name: "Gpay", value: "gpay"),
  const DropDownValueModel(name: "Net Banking", value: "netbank")
];
List<DropDownValueModel> bankList = [
  const DropDownValueModel(name: "Axis Bank", value: "Axis Bank"),
  const DropDownValueModel(name: "Bank of Baroda ", value: "Bank of Baroda "),
  const DropDownValueModel(name: "Canara Bank", value: "Canara Bank"),
  const DropDownValueModel(name: "HDFC Bank", value: "HDFC Bank"),
  const DropDownValueModel(name: "ICICI Bank", value: "ICICI Bank"),
  const DropDownValueModel(name: "Indian Bank ", value: "Indian Bank "),
  const DropDownValueModel(
      name: "Punjab National Bank (PNB)", value: "Punjab National Bank (PNB)"),
  const DropDownValueModel(
      name: "State Bank of India (SBI)", value: "State Bank of India (SBI)"),
  const DropDownValueModel(
      name: "Union Bank of India ", value: "Union Bank of India "),
  const DropDownValueModel(name: "Yes Bank", value: "Yes Bank"),
];
