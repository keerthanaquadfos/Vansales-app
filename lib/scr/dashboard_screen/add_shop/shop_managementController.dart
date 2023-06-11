import 'package:get/get.dart';
import 'package:van_sales_app/scr/dashboard_screen/add_shop/shop_management_screen.dart';

class ShopManagementController extends GetxController {
  final List<Shop> _shopList = [];
  final isLoding = false.obs;
  var name = '0000000'.obs;
  @override
  void onInit() {
    getVehicleList();
    super.onInit();
  }

  ///Get Stressed Farm List
  Future<void> getVehicleList() async {
    isLoding.value = true;
    //// _vehicleList = await APIManager.getListOfVehichles();
    // print("xxxxxxxxxxx${_vehicleList}0000000000000");
    //// name = '0000';
    // name =(vehicleList[0].name);
    // for (final item in _shopList) {
    //   print("Id is: ${item.name}");
    //   name.value = ('${item.name}');
    // }
    isLoding.value = false;
  }

  List<Shop> get getListedVehicle {
    return _shopList;
  }
}
