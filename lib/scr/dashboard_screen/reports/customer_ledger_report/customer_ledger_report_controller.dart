import 'package:get/get.dart';
import 'customer_ledger_report_screen.dart';

class CustomerLedgerReportController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<CustomerLedgerReportList> _customerLedgerReportList =
      <CustomerLedgerReportList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _customerLedgerReportList.addAll([
      CustomerLedgerReportList(

          //closingbalance: 0
          ),
      CustomerLedgerReportList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<CustomerLedgerReportList> get customerLedgerReportList =>
      _customerLedgerReportList.toList();
}
