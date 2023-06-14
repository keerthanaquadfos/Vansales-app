import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import 'offload_Sceen.dart';

class OffloadController extends GetxController {
  final TextEditingController barcodeController = TextEditingController();

  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<OffloadeList> _offloadeList = <OffloadeList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _offloadeList.addAll([
      OffloadeList(
          addedQuantity: 150.00,
          unit: "pkt",
          barcode: "54681316nhy6",
          expDate: "2/7/2023",
          product: "appam",
          siNo: 1,
          status: "read",
          stock: 200.00
          //closingbalance: 0
          ),
      OffloadeList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<OffloadeList> get ooffloadeList => _offloadeList.toList();

  void scanBarcode() async {
    String barcodeScan;
    try {
      barcodeScan = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Color of the scan button
        'Cancel', // Text for the cancel button
        true, // Show flash icon
        ScanMode.BARCODE, // Scan mode
      );
    } on PlatformException {
      barcodeScan = 'Failed to get platform version';
    }

    barcodeController.text = barcodeScan;
  }
}
