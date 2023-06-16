import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/scr/loginScreenn/login_screen_controller.dart';
import 'package:van_sales_app/utils/custom_colors.dart';
import '../../widgets/sign_in_button.dart';
import '../homeScreen/home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  LoginScreenController loginScreenController =
      Get.put(LoginScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(60),
          height: MediaQuery.of(context).size.height * 0.70,
          width:
              MediaQuery.of(context).size.width * 1.0, // 75% height of screen
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [signinTheamColor1, signinTheamColor2], // Gradient colors
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
                    style: TextStyle(color: logoWhite, fontSize: 20, height: 3),
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
                child: const Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
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
                    style: TextStyle(color: logoWhite, fontSize: 20, height: 3),
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
                    Get.to(() => const HomeScreen());
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
    ));
  }
}
