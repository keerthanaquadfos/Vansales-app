import 'package:get/get.dart';

import 'new_order_screen.dart';

class NewOrderController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;

  final RxList<OrderList> _orderList = <OrderList>[].obs;

  List<OrderList> get orderList => _orderList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
