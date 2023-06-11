import 'package:get/get.dart';
import 'add_order_screen.dart';

class AddOrderController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<ItemList> _itemList = <ItemList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _itemList.addAll([
      ItemList(
          siNo: 1,
          productname: "Fresh Appam",
          vanstock: 00.0,
          qtyneeded: 00,
          add: "add",
          remove: "remove",
          status: "added"),
      ItemList(
          siNo: 2,
          productname: "Fresh Chappathy",
          vanstock: 00.0,
          qtyneeded: 00,
          add: "add",
          remove: "remove",
          status: "added"),
      ItemList(
          siNo: 3,
          productname: "Fresh Idiyappam",
          vanstock: 00.0,
          qtyneeded: 00,
          add: "add",
          remove: "remove",
          status: "added"),
      // Add more fixed values as needed
    ]);
    isLoading.value = false;
  }

  List<ItemList> get itemList => _itemList.toList();

  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
