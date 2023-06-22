import 'package:get/get.dart';

import 'order_details_sceen.dart';

class OrderDetailsController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<OrderDetailsItemList> _orderDetailsItemList =
      <OrderDetailsItemList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _orderDetailsItemList.addAll([
      OrderDetailsItemList(
        siNo: 1,
        productname: "ABCD",
        qtyneeded: 0,
      )
      // Add more fixed values as needed
    ]);
    isLoading.value = false;
  }

  List<OrderDetailsItemList> get orderDetailsItemList =>
      _orderDetailsItemList.toList();
}
