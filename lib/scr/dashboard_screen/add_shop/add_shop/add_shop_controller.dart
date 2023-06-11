import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddShopController extends GetxController {
  //create variables
  final RxBool isLoading = true.obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;

  // instance for them to be called
  RxBool checkLoading() => isLoading;
  RxDouble getLatitude() => latitude;
  RxDouble getLongitude() => longitude;
// image picker

  final image = Rxn<PickedFile>();
  // File? image;
  // void pickImage() async {
  //   final pickedImage =
  //       await ImagePicker().getImage(source: ImageSource.camera);
  //   image.value = pickedImage;
  // }
  void pickImage() async {
    final XFile? pickedShopImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedShopImage != null) {
      image.value = PickedFile(pickedShopImage.path);
    }
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    // return if service is not enabled

    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }
    //Status of premission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission aare denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      //reqest permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }
    //get currentposition
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      latitude.value = value.latitude;
      longitude.value = value.longitude;
      /////////////////////////////
      // print(latitude.value);
      // print(longitude.value);

      ///////////////////////////
      //calling our weather api

      isLoading.value = false;
    });
  }
}