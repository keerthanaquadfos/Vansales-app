import 'package:get/get.dart';

import 'van_stock_screen.dart';

class VanStockController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<VanStockList> _vanStockList = <VanStockList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _vanStockList.addAll([
      VanStockList(
          openingstock: 100.00,
          change: 233.00,
          sold: 356.00,
          offloaded: 562.00,
          closing: 135.00,
          received: 10.00

          //closingbalance: 0
          ),
      VanStockList(
          openingstock: 100.00,
          sold: 356.00,
          offloaded: 562.00,
          change: 45.00,
          received: 15,
          closing: 135.00)
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<VanStockList> get vanStockList => _vanStockList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
