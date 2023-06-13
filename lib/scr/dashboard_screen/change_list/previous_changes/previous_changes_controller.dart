import 'package:get/get.dart';

import 'previous_changes_screen.dart';

class PreviousChangeListController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<PreviousChangeList> _previousChangeList =
      <PreviousChangeList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _previousChangeList.addAll([
      PreviousChangeList(

          //closingbalance: 0
          ),
      PreviousChangeList(

          // Add more fixed values as needed)
          )
    ]);
    isLoading.value = false;
  }

  List<PreviousChangeList> get previousChangeList =>
      _previousChangeList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
