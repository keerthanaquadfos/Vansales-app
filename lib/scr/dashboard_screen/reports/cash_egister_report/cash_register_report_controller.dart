import 'package:get/get.dart';

import 'cash_register_report_screen.dart';

class CasharegisterReportController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<CashRegisterReportList> _cashRegisterReportList =
      <CashRegisterReportList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _cashRegisterReportList.addAll([
      CashRegisterReportList(

          //closingbalance: 0
          ),
      CashRegisterReportList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<CashRegisterReportList> get cashRegisterReportList =>
      _cashRegisterReportList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
