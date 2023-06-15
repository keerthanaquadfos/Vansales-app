import 'package:get/get.dart';

import 'shop_in_status_scree.dart';

class ShopInStatusController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<ShopInStatusList> _shopInStatusList = <ShopInStatusList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _shopInStatusList.addAll([
      ShopInStatusList(

          //closingbalance: 0
          ),
      ShopInStatusList(

          // Add more fixed values as needed)
          )
    ]);
    isLoading.value = false;
  }

  List<ShopInStatusList> get shopInStatusList => _shopInStatusList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
