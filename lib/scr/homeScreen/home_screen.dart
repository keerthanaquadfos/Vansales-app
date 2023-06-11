import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/scr/DemoScreens/Demo1.dart';
import '../../utils/custom_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_drawer_widget.dart';
import '../dashboard_screen/dashboard_screen.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> screens = [
    const DashboardScreen(),
    const Demo1(),
    const Demo2(),
    const Demo3(),
    // Add other screens here
  ];

  RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the key to the Scaffold
      appBar: CustomAppBar(
        title: "Van Sales",
        onBackTap: () {},
        onMenuTap: () {
          _scaffoldKey.currentState?.openDrawer(); // Open the left-side drawer
        },
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1.00,
        color: Colors.white,
        child: Obx(() => screens[currentIndex.value]),
      ),
      drawer: const CustomDrawer(), // Add the custom drawer widget
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex.value,
        onTap: (index) {
          currentIndex.value = index;
        },
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed, // Disable shifting effect
      showSelectedLabels: false, // Hide labels
      showUnselectedLabels: false,
      backgroundColor: bottumnavigationWhite, // Set background color to gray
      selectedItemColor: selectedItemColor, // Set selected icon color
      unselectedItemColor: Colors.grey[400], // Set unselected icon color
      elevation: 0.0, // Set elevation to 0 to remove the shadow line
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 40,
          ),
          label: '', // Empty label
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 40,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.flash_on_sharp,
            size: 40,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            size: 40,
          ),
          label: '',
        ),
      ],
    );
  }
}
