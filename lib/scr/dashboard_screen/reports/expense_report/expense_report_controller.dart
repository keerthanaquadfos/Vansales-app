import 'package:get/get.dart';

import 'expense_report_screen.dart';

class ExpenseReportController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<ExpenseReportList> _expenseReportList =
      <ExpenseReportList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _expenseReportList.addAll([
      ExpenseReportList(

          //closingbalance: 0
          ),
      ExpenseReportList(

          // Add more fixed values as needed)
          )
    ]);
    isLoading.value = false;
  }

  List<ExpenseReportList> get expenseReportList => _expenseReportList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
