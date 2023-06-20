import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';
import 'package:van_sales_app/widgets/custom_dropdown.dart';
import 'package:van_sales_app/widgets/datepickertextfeild.dart';

import '../../../widgets/custom_textfeild.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  final TextEditingController _controllerComplaint = TextEditingController();
  // final TextEditingController _controllerComplaintType = TextEditingController();
  //final TextEditingController _controllerCostomerName = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _controllerComplaint.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Complaints"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CustemDropdown(
                  boxwidth: 1,
                  texthint: " Customer Name ",
                  itemcount: 5,
                  itemlist: customertList),
              CustemDropdown(
                  boxwidth: 1,
                  texthint: " Product ",
                  itemcount: 5,
                  itemlist: productList),
              CustemDropdown(
                  boxwidth: 1,
                  texthint: " Complaint Type",
                  itemcount: 3,
                  itemlist: complaintTypeList),
              LargeCustomTextField(
                controller: _controllerComplaint,
                text: 'Remarks',
              ),
              const DatePickerTextField(labelText: "Schedule Date"),
              const SizedBox(height: 20),
              CustomCurvedButton(
                onPressed: () {},
                buttonheight: 40,
                buttonwidth: 1,
                tittle: "Submit",
              )
            ],
          ),
        ),
      ),
    );
  }
}

final List<DropDownValueModel> customertList = [
  const DropDownValueModel(name: "Customer 1", value: "Customer 1"),
  const DropDownValueModel(name: "Customer 2", value: "Customer 2"),
  const DropDownValueModel(name: "Customer 3", value: "Customer 3"),
  const DropDownValueModel(name: "Customer 4", value: "Customer 4"),
  const DropDownValueModel(name: "Customer 5", value: "Customer 5"),
];
final List<DropDownValueModel> productList = [
  const DropDownValueModel(name: "Product 1", value: "product 1"),
  const DropDownValueModel(name: "Product 2", value: "product 2"),
  const DropDownValueModel(name: "Product 3", value: "product 3"),
  const DropDownValueModel(name: "Product 4", value: "product 4"),
  const DropDownValueModel(name: "Product 5", value: "product 5"),
];
final List<DropDownValueModel> complaintTypeList = [
  const DropDownValueModel(name: "Service", value: "Service"),
  const DropDownValueModel(name: "Not Working ", value: "notworking"),
  const DropDownValueModel(name: "NO Power ", value: "nopower"),
];
