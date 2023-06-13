import 'package:get/get.dart';

import 'order_report_screen.dart';

class OrderReportController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<OrderReportList> _orderReportList = <OrderReportList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _orderReportList.addAll([
      OrderReportList(

          //closingbalance: 0
          ),
      OrderReportList(

          // Add more fixed values as needed)
          )
    ]);
    isLoading.value = false;
  }

  List<OrderReportList> get orderReportList => _orderReportList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
