import 'package:get/get.dart';

import 'grv_list_screen.dart';

class GRVListController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<GRVList> _gRVList = <GRVList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _gRVList.addAll([
      GRVList(

          //closingbalance: 0
          ),
      GRVList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<GRVList> get gRVList => _gRVList.toList();
}
