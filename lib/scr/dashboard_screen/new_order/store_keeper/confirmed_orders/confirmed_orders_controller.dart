import 'package:get/get.dart';

import 'confirmed_oredrs_screen.dart';

class ConfirmedOrderController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<ConfirmedOrderList> _confirmedOrderList =
      <ConfirmedOrderList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _confirmedOrderList.addAll([
      ConfirmedOrderList(),

      ConfirmedOrderList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<ConfirmedOrderList> get confirmedOrderList =>
      _confirmedOrderList.toList();
}
