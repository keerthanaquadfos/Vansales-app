import 'package:get/get.dart';

import 'sales_return_register_screen.dart';

class SalesReturnReportController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<SalesReturnRegisterList> _salesReturnRegisterList =
      <SalesReturnRegisterList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _salesReturnRegisterList.addAll([
      SalesReturnRegisterList(

          //closingbalance: 0
          ),
      SalesReturnRegisterList(

          // Add more fixed values as needed)
          )
    ]);
    isLoading.value = false;
  }

  List<SalesReturnRegisterList> get salesReturnRegisterList =>
      _salesReturnRegisterList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
