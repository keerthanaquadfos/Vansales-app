import 'package:get/get.dart';

import 'previous_returns_screen.dart';

class PreviousReturnsController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<PreviousReturnsList> _previousReturnsList =
      <PreviousReturnsList>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the list with fixed values
    _previousReturnsList.addAll([
      PreviousReturnsList(

          //closingbalance: 0
          ),
      PreviousReturnsList()
      // Add more fixed values as needed)
    ]);
    isLoading.value = false;
  }

  List<PreviousReturnsList> get previousReturnsList =>
      _previousReturnsList.toList();
}
