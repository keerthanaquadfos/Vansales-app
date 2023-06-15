import 'package:get/get.dart';
import 'deposit_screen.dart';

class DepositController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<DepositList> _depositList = <DepositList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _depositList.addAll([
      DepositList(

          //closingbalance: 0
          ),
      DepositList(

          // Add more fixed values as needed)
          )
    ]);
    isLoading.value = false;
  }

  List<DepositList> get depositList => _depositList.toList();
}
