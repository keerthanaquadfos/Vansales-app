import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/scr/loginScreenn/login_screen_controller.dart';
import 'package:van_sales_app/utils/custom_colors.dart';
import '../../widgets/sign_in_button.dart';
import '../homeScreen/home_screen.dart';
import 'package:van_sales_app/utils/globals.dart' as globals;

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  LoginScreenController loginScreenController =
      Get.put(LoginScreenController());
  final TextEditingController _controllerUserName = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _controllerUserName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(60),
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width *
                  1.0, // 75% height of screen
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    signinTheamColor1,
                    signinTheamColor2
                  ], // Gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 100,
                    color: logoWhite,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "USER NAME",
                        style: TextStyle(
                            color: logoWhite, fontSize: 20, height: 3),
                      ),
                    ],
                  ),
                  Container(
                    //margin: const EdgeInsets.symmetric(horizontal: 40),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: _controllerUserName,
                          decoration: const InputDecoration(
                            hintText: 'User Name',
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "PASSWORD",
                        style: TextStyle(
                            color: logoWhite, fontSize: 20, height: 3),
                      ),
                    ],
                  ),
                  Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 40),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                      ),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() => Checkbox(
                            value: loginScreenController.isChecked.value,
                            onChanged: (value) {
                              loginScreenController.toggleCheckbox();
                            },
                          )),
                      const Text(
                        'Remember me',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.search,
                    size: 50,
                    color: icongray,
                  ),
                  SignInButtonTile(
                      tittle: "SIGN IN",
                      onPressed: () {
                        print(_controllerUserName.text);
                        if (_controllerUserName.text == "Storekeeper") {
                          globals.isStoreKeeper = true;
                          Get.off(() => const HomeScreen());
                        } else if (_controllerUserName.text == "Salesstaff") {
                          globals.isSalesStaff = true;
                          Get.off(() => const HomeScreen());
                        } else {
                          print("${_controllerUserName.text}  Storekeeper");
                          print("${_controllerUserName.text} Salesstaff");
                          showAlertPopup(context);
                        }
                      }),
                  const Icon(
                    Icons.settings,
                    size: 50,
                    color: icongray,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void showAlertPopup(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Alert'),
        content: const Text('ENTER the User Name "Storekeeper/Salesstaff" '),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Clear the text field
              _controllerUserName.clear();
              Navigator.pop(context, 'OK');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
