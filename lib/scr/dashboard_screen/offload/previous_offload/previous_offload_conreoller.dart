import 'package:get/get.dart';

import 'previous_offload_screen.dart';

class PreviousOffloadController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<PreviousOffloadList> _previousOffloadList =
      <PreviousOffloadList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _previousOffloadList.addAll([
      PreviousOffloadList(

          //closingbalance: 0
          ),
      PreviousOffloadList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<PreviousOffloadList> get previousOffloadList =>
      _previousOffloadList.toList();
}
