import 'package:get/get.dart';

import 'invoice_list_screen.dart';
// import 'package:van_sales_app/scr/dashboard_screen/invoice_list/invoice_list_screen.dart';

class HomeInvoiveController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<HomeInvoiceList> _homeInvoiceList = <HomeInvoiceList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _homeInvoiceList.addAll([
      HomeInvoiceList(

          //closingbalance: 0
          ),
      HomeInvoiceList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<HomeInvoiceList> get homeInvoiceList => _homeInvoiceList.toList();
}

class HomeInvoiveControllerTest extends GetxController {
  final RxBool isLoading = false.obs; //true*
  RxBool checkLoading() => isLoading;
  final RxList<HomeInvoiceList> _homeInvoiceList = <HomeInvoiceList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _homeInvoiceList.addAll([
      HomeInvoiceList(

          //closingbalance: 0
          ),
      HomeInvoiceList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<HomeInvoiceList> get homeInvoiceList => _homeInvoiceList.toList();
}
