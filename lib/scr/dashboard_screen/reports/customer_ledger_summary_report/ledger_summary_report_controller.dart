import 'package:get/get.dart';

import 'ledger_summary_report_screen.dart';

class LedgerSummaryReportController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<LedgerSummaryReportList> _ledgerSummaryReportList =
      <LedgerSummaryReportList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _ledgerSummaryReportList.addAll([
      LedgerSummaryReportList(
        siNo: 1,
        customer: "ABC foods",
        openingbalance: 100000,
        debit: 1500,
        credit: 2000,
        //closingbalance: 0
      ),
      LedgerSummaryReportList(
          siNo: 1,
          customer: "ABC foods",
          //openingbalance: 0,
          debit: 1500,
          credit: 2000,
          closingbalance: 909500)
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<LedgerSummaryReportList> get ledgerSummaryReportList =>
      _ledgerSummaryReportList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
