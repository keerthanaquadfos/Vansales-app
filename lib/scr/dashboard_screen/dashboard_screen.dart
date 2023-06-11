import 'package:flutter/material.dart';
import 'package:van_sales_app/scr/dashboard_screen/add_shop/shop_management_screen.dart';
import 'package:van_sales_app/scr/dashboard_screen/new_order/new_order_screen/new_order_screen.dart';
import 'package:van_sales_app/scr/dashboard_screen/reports/reports_screen.dart';
import 'package:van_sales_app/scr/dashboard_screen/show_client/show_client.dart';
import '../../utils/custom_colors.dart';
import '../../widgets/tile_container.dart';
import '../orderDetails/orderDetailsScreen.dart';
import 'expenses/expense_management/expense_management.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width * 1.0, // 75% height of screen
        decoration: const BoxDecoration(
          color: dashAppBarColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),

        //header section
        child: const Column(
          children: [
            DashHeader(),
            SingleChildScrollView(
              child: Column(
                children: [SizedBox(height: 500, child: TilesGrid())],
              ),
            ),
          ],
        ));
  }
}

class DashHeader extends StatelessWidget {
  const DashHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Image.asset(""),
        Icon(
          Icons.account_circle_sharp,
          size: 100,
        ),
        Text(
          "Good morning sir",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: dashHeaderItemColor),
        ),
        Text(
          "Start time : 9.00 AM, Active for :4 hr 56 min",
          style: TextStyle(
              fontSize: 16, height: 1.5, color: dashHeaderSubItemColor),
        ),

        Divider(
          color: Colors.black,
          thickness: 1.0,
          height: 50.0,
        ),
      ],
    );
  }
}

class TilesGrid extends StatelessWidget {
  const TilesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .88,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          return TileContainer(
            reportTiledata: tileGridtlist[index],
          );
        },
        itemCount: tileGridtlist.length,
        shrinkWrap: true, // Set shrinkWrap to true
      ),
    );
  }
}

class TileGridModel {
  int? id;
  String imagrUrl;
  String title;
  Widget reportpage;
  TileGridModel(
      {this.id,
      required this.imagrUrl,
      required this.reportpage,
      required this.title});
}

final List<TileGridModel> tileGridtlist = [
  TileGridModel(
    id: 0,
    imagrUrl: "assets/images/schedules_Icons-09.png",
    title: "Schedules",
    reportpage: const OrederDetailsScreen(),
  ),
  TileGridModel(
    id: 1,
    imagrUrl: "assets/images/add_client_Icons-10.png",
    title: 'Add client',
    reportpage: const ShopManagementScreen(),
  ),
  TileGridModel(
    id: 2,
    imagrUrl: "assets/images/overdues_Icons-11.png",
    title: 'Overdues',
    reportpage: const DemoScreen1(),
  ),
  TileGridModel(
    id: 3,
    imagrUrl: "assets/images/product_Icons-12.png",
    title: 'Product',
    reportpage: const OrederDetailsScreen(),
  ),
  TileGridModel(
    id: 4,
    imagrUrl: "assets/images/expenses_Icons-13.png",
    title: 'Expenses',
    reportpage: const ExpenseManagement(),
  ),
  TileGridModel(
    id: 5,
    imagrUrl: "assets/images/incentives_Icons-14.png",
    title: 'Show Client',
    reportpage: const ShowClientScreen(),
  ),
  TileGridModel(
    id: 6,
    imagrUrl: "assets/images/new_arrival_Icons-15.png",
    title: 'New Order',
    reportpage: const NewOrderScreen(),
  ),
  TileGridModel(
    id: 7,
    imagrUrl: "assets/images/branding_material_Icons-16.png",
    title: 'Reports',
    reportpage: const ReportsScreen(),
  ),
  TileGridModel(
    id: 8,
    imagrUrl: "assets/images/activities_Icons-17.png",
    title: 'Activities',
    reportpage: const OrederDetailsScreen(),
  ),
  TileGridModel(
    id: 9,
    imagrUrl: "assets/images/offer_Icons-18.png",
    title: 'Offers',
    reportpage: const OrederDetailsScreen(),
  ),
  TileGridModel(
    id: 10,
    imagrUrl: "assets/images/help_Icons-19.png",
    title: 'Help',
    reportpage: const OrederDetailsScreen(),
  ),
  TileGridModel(
    id: 11,
    imagrUrl: "assets/images/target_achievements_Icons-20.png",
    title: 'Target/ Achievments',
    reportpage: const OrederDetailsScreen(),
  ),
  TileGridModel(
    id: 12,
    imagrUrl: "assets/images/offer_Icons-18.png",
    title: 'Offers',
    reportpage: const OrederDetailsScreen(),
  ),
  TileGridModel(
    id: 13,
    imagrUrl: "assets/images/offer_Icons-18.png",
    title: 'Help',
    reportpage: const OrederDetailsScreen(),
  ),
  TileGridModel(
    id: 14,
    imagrUrl: "assets/images/offer_Icons-18.png",
    title: 'Target/ Achievments',
    reportpage: const OrederDetailsScreen(),
  ),
];
