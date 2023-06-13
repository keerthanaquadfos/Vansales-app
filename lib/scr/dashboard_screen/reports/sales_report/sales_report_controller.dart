import 'package:get/get.dart';

import 'sales_report_screen.dart';

class SalesReportController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<SalesReportList> _salesReportList = <SalesReportList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _salesReportList.addAll([
      SalesReportList(

          //closingbalance: 0
          ),
      SalesReportList(

          // Add more fixed values as needed)
          )
    ]);
    isLoading.value = false;
  }

  List<SalesReportList> get salesReportList => _salesReportList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
