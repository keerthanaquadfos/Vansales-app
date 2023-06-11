import 'package:get/get.dart';

class DashboardController extends GetxController {
  final selectedTiles = <int>[].obs;

  void toggleSelection(int index) {
    if (selectedTiles.contains(index)) {
      selectedTiles.remove(index);
    } else {
      selectedTiles.add(index);
    }
  }
}
