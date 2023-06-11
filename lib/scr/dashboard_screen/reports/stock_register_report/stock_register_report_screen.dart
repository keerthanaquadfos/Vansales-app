import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../utils/custom_colors.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_curved_button.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../../../../widgets/datepickertextfeild.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class StockRegisterReportScreen extends StatefulWidget {
  const StockRegisterReportScreen({super.key});

  @override
  State<StockRegisterReportScreen> createState() =>
      _StockRegisterReportScreenState();
}

class _StockRegisterReportScreenState extends State<StockRegisterReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Stock Register Report "),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const DatePickerTextField(labelText: "From Date"),
                const DatePickerTextField(labelText: "To Date"),
                CustemDropdown(
                  boxwidth: MediaQuery.of(context).size.width * 1,
                  itemcount: 2,
                  texthint: "type",
                  itemlist: customertypeitemlist,
                ),
                CustomCurvedButton(
                    tittle: "Submit",
                    onPressed: () {},
                    buttonheight: 40,
                    buttonwidth: MediaQuery.of(context).size.width * 1),
                CustomCurvedButton(
                    tittle: "PDF",
                    onPressed: () {},
                    buttonheight: 40,
                    buttonwidth: MediaQuery.of(context).size.width * 1),
              ],
            ),
          ),
          // const CashRegisterReportTable(),
        ],
      ),
    );
  }
}

List<DropDownValueModel> customertypeitemlist = [
  const DropDownValueModel(name: 'Fresh', value: "value1"),
  const DropDownValueModel(name: 'Second', value: "value2")
];
