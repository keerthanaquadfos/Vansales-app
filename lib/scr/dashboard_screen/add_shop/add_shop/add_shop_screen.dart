import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/scr/dashboard_screen/add_shop/add_shop/add_shop_controller.dart';
import 'package:van_sales_app/utils/custom_colors.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:van_sales_app/widgets/custom_textfeild.dart';

import '../../../../widgets/custom_dropdown.dart';
// import "package:image_picker/image_picker.dart";

class AddShopScreen extends StatefulWidget {
  const AddShopScreen({super.key});

  @override
  State<AddShopScreen> createState() => _AddShopScreenState();
}

class _AddShopScreenState extends State<AddShopScreen> {
  AddShopController addShopController = Get.put(AddShopController());
  final TextEditingController _controllerLocaton = TextEditingController();

  @override
  void initState() {
    ever(addShopController.latitudeCurrent, (_) {
      _controllerLocaton.text =
          ("Latitude:${addShopController.latitudeCurrent.value.toString()}");
    });
    ever(addShopController.longitudeCurrent, (_) {
      _controllerLocaton.text =
          ("Longitude:${addShopController.longitudeCurrent.value.toString()}");
    });
    super.initState();
  }

  final TextEditingController _controllerShopName = TextEditingController();
  final TextEditingController _controllerShopCode = TextEditingController();
  final TextEditingController _controllerPlace = TextEditingController();
  final TextEditingController _controllerPSNo = TextEditingController();
  final TextEditingController _controllerMobNo = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerTRNNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "ADD SHOP"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CustomTextField(
                  controller: _controllerShopName, text: "Shop Name"),
              CustomTextField(
                controller: _controllerShopCode,
                text: 'Shop Code',
              ),
              CustomTextField(controller: _controllerPlace, text: "Place*"),
              CustomTextField(
                controller: _controllerPSNo,
                text: 'PS No*',
              ),
              CustomTextField(
                controller: _controllerMobNo,
                text: 'Mobil Number',
              ),
              CustomTextField(controller: _controllerEmail, text: "Email*"),
              CustomTextField(
                controller: _controllerTRNNo,
                text: 'TRN NO',
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustemDropdown(
                      texthint: "Customer Type",
                      boxwidth: .45,
                      itemcount: 2,
                      itemlist: customertypeitemlist,
                    ),
                    CustemDropdown(
                      texthint: "Emirates",
                      boxwidth: .45,
                      itemcount: 1,
                      itemlist: emirateslist,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustemDropdown(
                    texthint: "Sales Type",
                    boxwidth: .45,
                    itemcount: 1,
                    itemlist: salestypeitemlist,
                  ),
                  CustemDropdown(
                    texthint: "Route",
                    boxwidth: .45,
                    itemcount: 1,
                    itemlist: routelist,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: TextField(
                  readOnly: true,
                  onTap: () {
                    //  print("test"); //addShopController.isLoading.value
                    addShopController.getLocation();
                  },
                  controller: _controllerLocaton,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: signinTheamColor1),
                    ),
                    label: Text(' Location'),
                  ),
                ),
              ),

              /////////////////image picker
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    addShopController.pickImage();
                  },
                  child: const Icon(Icons.camera_alt),
                ),
              ),

              Center(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  width: 200,
                  height: 200,
                  child: Obx(
                    () {
                      try {
                        final pickedImage = addShopController.image.value;
                        if (pickedImage != null) {
                          return Image.file(
                            File(pickedImage.path),
                            fit: BoxFit.cover,
                          );
                        } else {
                          return const Text('No image selected');
                        }
                      } catch (e) {
                        print('Error occurred while loading the image: $e');
                        return const Text('Error loading image');
                      }
                    },
                  ),
                ),
              ),

              SizedBox(
                height: 57,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: signinTheamColor1,
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<DropDownValueModel> customertypeitemlist = [
  const DropDownValueModel(name: 'Hypermarket', value: "value1"),
  const DropDownValueModel(name: 'Supermarket', value: "value2")
];
List<DropDownValueModel> emirateslist = [
  const DropDownValueModel(name: 'Abudhabi', value: "value1"),
];
List<DropDownValueModel> salestypeitemlist = [
  const DropDownValueModel(name: 'Credit', value: "value1"),
  //const DropDownValueModel(name: 'Supermarket', value: "value2")
];
List<DropDownValueModel> routelist = [
  const DropDownValueModel(name: 'Select Route', value: "value1"),
];
