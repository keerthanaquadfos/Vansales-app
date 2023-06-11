import 'package:get/get.dart';
import 'package:van_sales_app/scr/dashboard_screen/show_client/show_client.dart';

class ShowClientController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<ClientList> _clientList = <ClientList>[].obs;

  List<ClientList> get shopList => _clientList.toList();
  // double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  // void addExpense(ClientList shop) {
  //   _shopList.add(shop);
  // }
}
