import 'package:get/get.dart';

import 'stock_register_report_screen.dart';

class StockRegisterReportController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<StockRegiterReportList> _stockRegiterReportList =
      <StockRegiterReportList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _stockRegiterReportList.addAll([
      StockRegiterReportList(
          openingstock: 100.00,
          issued: 100.00,
          changein: 233.00,
          returnitem: 125.00,
          sold: 356.00,
          offloaded: 562.00,
          change: 45.00,
          closing: 135.00

          //closingbalance: 0
          ),
      StockRegiterReportList(
          openingstock: 100.00,
          issued: 100.00,
          changein: 233.00,
          returnitem: 125.00,
          sold: 356.00,
          offloaded: 562.00,
          change: 45.00,
          closing: 135.00)
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<StockRegiterReportList> get stockRegiterReportList =>
      _stockRegiterReportList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
