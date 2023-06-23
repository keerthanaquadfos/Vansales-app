import 'package:get/get.dart';

import 'declined_orders_screen.dart';

class DeclinedOrderController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<DeclinedOrderList> _declinedOrderList =
      <DeclinedOrderList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _declinedOrderList.addAll([
      DeclinedOrderList(),

      DeclinedOrderList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<DeclinedOrderList> get declinedOrderList => _declinedOrderList.toList();
}
