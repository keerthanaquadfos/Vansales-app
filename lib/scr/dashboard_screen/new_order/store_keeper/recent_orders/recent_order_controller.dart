import 'package:get/get.dart';

import 'recent_orders_screen.dart';

class RecentOrderController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<RecentOrderList> _recentOrderList = <RecentOrderList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _recentOrderList.addAll([
      RecentOrderList(),

      RecentOrderList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<RecentOrderList> get recentOrderList => _recentOrderList.toList();
}
