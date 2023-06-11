import 'package:van_sales_app/widgets/custom_app_bar.dart';
import '../../utils/custom_colors.dart';
import 'package:flutter/material.dart';
import '../dashboard_screen/dashboard_screen.dart';

class OrederDetailsScreen extends StatelessWidget {
  const OrederDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Vansales"),
      body: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(bottom: 10),
        height: MediaQuery.of(context).size.height * 0.87,
        width: MediaQuery.of(context).size.width * 1.0, // 75% height of screen
        decoration: const BoxDecoration(
          color: dashAppBarColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),

        //header section

        child: Column(
          children: [
            const DashHeader(),
            SingleChildScrollView(
              child: Column(
                children: [
                  const ListHead(),
                  ReportList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem {
  ListItem(this.itemname, this.itemvalue);
  final String itemname;
  final double itemvalue;
}

class ListHead extends StatelessWidget {
  const ListHead({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(children: [
              Text("Planned"),
              SizedBox(
                height: 10,
              ),
              Text("0.00")
            ]),
            Column(children: [
              Text("Visited"),
              SizedBox(
                height: 10,
              ),
              Text("0.00")
            ]),
            Column(children: [
              Text("NVR"),
              SizedBox(
                height: 10,
              ),
              Text("0.00")
            ]),
          ],
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

class ReportList extends StatelessWidget {
  ReportList({Key? key});
  final List<ListItem> itemname = [
    ListItem("New order", 00),
    ListItem("Order Value", 00),
    ListItem("Today's Collection", 00),
    ListItem("Cash", 00),
    ListItem("Cheque", 00),
    ListItem("Expenses", 00),
    ListItem("Cash in Hand", 00),
    ListItem("Deposited", 00),
    ListItem("Balance", 00),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: itemname.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: 0), // Adjust the height of the separator here
      itemBuilder: (context, index) {
        final item = itemname[index];
        return ListTile(
          style: ListTileStyle.list,
          title: Container(
            padding: const EdgeInsets.all(10),
            color: index.isEven || index == 0 ? dashAppBarColor : Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${item.itemname}   '),
                  Text('${item.itemvalue}  '),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DemoScreen1 extends StatelessWidget {
  const DemoScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "VANSALES"),
      body: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          height: MediaQuery.of(context).size.height * 0.80,
          width:
              MediaQuery.of(context).size.width * 1.0, // 75% height of screen
          decoration: const BoxDecoration(
            color: dashAppBarColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60),
            ),
          ),

          //header section
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      margin: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: const Image(
                          image: AssetImage(
                              'assets/others/220px-Tuck_Shop_in_Oxford.jpg'),
                        ),
                      ),
                    ),
                    const Text(
                      "Tuck Shop",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: dashHeaderItemColor),
                    ),
                    const Text(
                      "Gandhinagar, edappally, kochi",
                      style: TextStyle(
                          fontSize: 18, color: dashHeaderSubItemColor),
                    ),
                    const Text(
                      "999 5888 047",
                      style: TextStyle(
                          fontSize: 18, color: dashHeaderSubItemColor),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price Level:",
                            style: TextStyle(
                                height: 2,
                                fontSize: 18,
                                color: dashHeaderSubItemColor),
                          ),
                          Text(
                            "Credit Limit:",
                            style: TextStyle(
                                height: 2,
                                fontSize: 18,
                                color: dashHeaderSubItemColor),
                          ),
                          Text(
                            "Total Outstanding:",
                            style: TextStyle(
                                height: 2,
                                fontSize: 18,
                                color: dashHeaderSubItemColor),
                          ),
                          Text(
                            "Total License Expiry:",
                            style: TextStyle(
                                height: 2,
                                fontSize: 18,
                                color: dashHeaderSubItemColor),
                          ),
                        ]),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "MTD:",
                      style: TextStyle(
                          height: 2,
                          fontSize: 18,
                          color: dashHeaderSubItemColor),
                    ),
                    Text(
                      "YTD:",
                      style: TextStyle(
                          fontSize: 18,
                          height: 2,
                          color: dashHeaderSubItemColor),
                    ),
                    Text(
                      "PDC:",
                      style: TextStyle(
                          fontSize: 18,
                          height: 2,
                          color: dashHeaderSubItemColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TuckShop()
            ],
          )),
    );
  }
}

class TuckShop extends StatefulWidget {
  const TuckShop({super.key});

  @override
  State<TuckShop> createState() => _TuckShopState();
}

class _TuckShopState extends State<TuckShop> {
  // ContainerController containerController = Get.put(ContainerController());

  final List<String> images = [
    "assets/images/schedules_Icons-09.png",
    "assets/images/add_client_Icons-10.png",
    "assets/images/overdues_Icons-11.png",
    "assets/images/product_Icons-12.png",
    "assets/images/expenses_Icons-13.png",
    "assets/images/incentives_Icons-14.png",
  ];

  final List<String> imagesselected = [
    "assets/images/overdues_Icons-11.png",
    "assets/images/overdues_Icons-11.png",
    "assets/images/overdues_Icons-11.png",
    "assets/images/overdues_Icons-11.png",
    "assets/images/overdues_Icons-11.png",
    "assets/images/overdues_Icons-11.png",
  ];

  final List<String> titles = [
    'Schedules',
    'Add client',
    'Overdues',
    'Product',
    'Expenses',
    'Incentives',
  ];

  final List<Widget> peges = [
    const OrederDetailsScreen(),
    const DemoScreen1(),
    const OrederDetailsScreen(),
    const OrederDetailsScreen(),
    const OrederDetailsScreen(),
    const OrederDetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .88,
      // child: GridView.builder(
      //   scrollDirection: Axis.vertical,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     childAspectRatio: 1.0,
      //   ),
      //   itemBuilder: (context, index) {
      //     return TileContainer(
      //       text: titles[index],
      //       image: images[index],
      //       indx: index,
      //       pages: peges[index],
      //     );
      //   },
      //   itemCount: images.length,
      //   shrinkWrap: true, // Set shrinkWrap to true
      // ),
    );
  }
}
