import 'package:get/get.dart';
import 'package:van_sales_app/scr/dashboard_screen/receipt_list/previous_receipt_list_screen.dart';

class ReceiptListController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<ReceiptList> _receiptList = <ReceiptList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _receiptList.addAll([
      ReceiptList(

          //closingbalance: 0
          ),
      ReceiptList(

          // Add more fixed values as needed)
          )
    ]);
    isLoading.value = false;
  }

  List<ReceiptList> get receiptList => _receiptList.toList();
}
