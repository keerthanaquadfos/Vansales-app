import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/widgets/custom_textfeild.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_curved_button.dart';
import 'offload_controller.dart';

class OffloadScreen extends StatefulWidget {
  const OffloadScreen({super.key});

  @override
  State<OffloadScreen> createState() => _OffloadScreenState();
}

class _OffloadScreenState extends State<OffloadScreen> {
  // final OffloadController offloadController = Get.put(OffloadController());
  final Rx<TextEditingController> _controllerBarcodeScan =
      TextEditingController().obs;
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
                // CustomTextFielBox(
                //     controller: offloadController.barcodeController,
                //     text: "Scan Barcode"),
                // ElevatedButton(
                //   onPressed: () {
                //     offloadController.scanBarcode();
                //   },
                //   child: Text('Scan Barcode'),
                // ),
                CustomCurvedButton(
                    tittle: "LOAD",
                    onPressed: () {},
                    buttonheight: 40,
                    buttonwidth: MediaQuery.of(context).size.width * .95),
              ],
            ),
          ),
          // const OrderReportTable(),
        ],
      ),
    );
  }
}
