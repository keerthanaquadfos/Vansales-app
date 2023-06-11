import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/custom_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .6,
        child: Drawer(
          elevation: 0, // Remove the elevation
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      signinTheamColor1,
                      signinTheamColor2
                    ], // Gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white),
                    ),
                    const Text(
                      'NAME',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              ListTile(
                dense: true,
                contentPadding: const EdgeInsets.only(left: 50),
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Settings'),
                onTap: () {
                  // Handle Home menu item tap
                  Get.back(); // Close the drawer
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 50),
                leading: const Icon(Icons.calendar_today),
                title: const Text('Attendance'),
                onTap: () {
                  // Handle Profile menu item tap
                  Get.back(); // Close the drawer
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 50),
                leading: const Icon(Icons.account_balance_wallet_outlined),
                title: const Text('Expenses'),
                onTap: () {
                  // Handle Activities menu item tap
                  Get.back(); // Close the drawer
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 50),
                leading: const Icon(Icons.person_off),
                title: const Text('Blocked Users'),
                onTap: () {
                  // Handle Settings menu item tap
                  Get.back(); // Close the drawer
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 50),
                leading: const Icon(Icons.list_alt_sharp),
                title: const Text(' Reports'),
                onTap: () {
                  // Handle Settings menu item tap
                  Get.back(); // Close the drawer
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 50),
                leading: const Icon(Icons.shopping_cart),
                title: const Text('Unplanned orders'),
                onTap: () {
                  // Handle Settings menu item tap
                  Get.back(); // Close the drawer
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
