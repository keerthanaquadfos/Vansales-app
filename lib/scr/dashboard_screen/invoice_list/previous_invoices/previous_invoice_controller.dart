import 'package:get/get.dart';

import 'previos_invoice_screen.dart';

class PreviousInvoiveController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<PreviousInvoiceList> _previousInvoiceList =
      <PreviousInvoiceList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _previousInvoiceList.addAll([
      PreviousInvoiceList(

          //closingbalance: 0
          ),
      PreviousInvoiceList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<PreviousInvoiceList> get previousInvoiceList =>
      _previousInvoiceList.toList();
}
