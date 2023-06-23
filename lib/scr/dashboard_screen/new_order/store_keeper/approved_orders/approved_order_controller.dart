import 'package:get/get.dart';

import 'approved_order_screen.dart';

class ApprovedOrderController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<ApprovedOrderList> _approvedOrderList =
      <ApprovedOrderList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _approvedOrderList.addAll([
      ApprovedOrderList(),

      ApprovedOrderList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<ApprovedOrderList> get approvedOrderList => _approvedOrderList.toList();
}
