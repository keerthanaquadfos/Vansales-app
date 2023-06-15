import 'package:get/get.dart';

import '_receipt_screen.dart';

class MainReceiptListController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<MainReceiptList> _mainRreceiptList = <MainReceiptList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _mainRreceiptList.addAll([
      MainReceiptList(

          //closingbalance: 0
          ),
      MainReceiptList(

          // Add more fixed values as needed)
          )
    ]);
    isLoading.value = false;
  }

  List<MainReceiptList> get mainRreceiptList => _mainRreceiptList.toList();
}
