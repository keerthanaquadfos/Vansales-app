import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:van_sales_app/scr/dashboard_screen/expenses/add_expense/add_expense.dart';

class AddExpenseController extends GetxController {
  final RxBool isLoading = true.obs;
  RxBool checkLoading() => isLoading;
  final RxList<Shop> _shopList = <Shop>[].obs;
// image picker

  final image = Rxn<PickedFile>();
  // File? image;
  // void pickImage() async {
  //   final pickedImage =
  //       await ImagePicker().getImage(source: ImageSource.camera);
  //   image.value = pickedImage;
  // }
  void pickImage() async {
    try {
      final XFile? pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedImage != null) {
        image.value = PickedFile(pickedImage.path);
      }
    } catch (e) {
      print('Error occurred while loading the image: controll $e');
    }
  }

  List<Shop> get shopList => _shopList.toList();
  double get totalExpense => 100.0;
//double get totalExpense => _shopList.fold(0, (sum, shop) => sum + (double.tryParse(shop.amount) ?? 0));
//   double get totalExpense =>
//       _shopList.fold(0, (sum, shop) => sum + double.parse(shop.amount));

  void addExpense(Shop shop) {
    _shopList.add(shop);
  }
}
