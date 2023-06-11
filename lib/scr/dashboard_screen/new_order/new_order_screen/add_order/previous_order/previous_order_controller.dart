import 'package:get/get.dart';
import 'previous_order_screen.dart';

class PreviousOrderController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<PreviousOrderList> _previousOrderList =
      <PreviousOrderList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _previousOrderList.addAll([
      PreviousOrderList(
          siNo: 1,
          orderno: "12345",
          date: "2023-06-01",
          getPreviousOrderDetails: "Get order"),
      PreviousOrderList(
          siNo: 2,
          orderno: "67890",
          date: "2023-06-02",
          getPreviousOrderDetails: "Get order"),
      // Add more fixed values as needed
    ]);
    isLoading.value = false;
  }

  List<PreviousOrderList> get previousOrderList => _previousOrderList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
