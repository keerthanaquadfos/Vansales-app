import 'package:get/get.dart';

import 'products_screen.dart';

class ProductsController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<ProductList> _productList = <ProductList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _productList.addAll([
      ProductList(

          //closingbalance: 0
          ),
      ProductList(

          // Add more fixed values as needed)
          )
    ]);
    isLoading.value = false;
  }

  List<ProductList> get productList => _productList.toList();
}
