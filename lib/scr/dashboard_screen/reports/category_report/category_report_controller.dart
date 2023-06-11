import 'package:get/get.dart';

import 'category_report_screen.dart';

class CategoryReportController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<CategoryReportList> _categoryReportList =
      <CategoryReportList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _categoryReportList.addAll([
      CategoryReportList(

          //closingbalance: 0
          ),
      CategoryReportList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<CategoryReportList> get categoryReportList =>
      _categoryReportList.toList();
}
