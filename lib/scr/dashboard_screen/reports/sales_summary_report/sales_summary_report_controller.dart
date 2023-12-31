import 'package:get/get.dart';

import 'sales_summary_report_screen.dart';

class SalesSummaryReportController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<SalesSummaryReportList> _salesSummaryReportList =
      <SalesSummaryReportList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _salesSummaryReportList.addAll([
      SalesSummaryReportList(

          //closingbalance: 0
          ),
      SalesSummaryReportList(

          // Add more fixed values as needed)
          )
    ]);
    isLoading.value = false;
  }

  List<SalesSummaryReportList> get salesSummaryReportList =>
      _salesSummaryReportList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
