import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';

import 'recent_orders/recent_orders_screen.dart';

class StoreKeeperOrderScreen extends StatelessWidget {
  const StoreKeeperOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Orders"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCurvedButton(
              onPressed: () {
                Get.to(const RecentOrderScreen());
              },
              buttonheight: 50,
              buttonwidth: 1,
              tittle: "Recent Orders",
            ),
            CustomCurvedButton(
              onPressed: () {},
              buttonheight: 50,
              buttonwidth: 1,
              tittle: "Confirmed  Orders",
            )
          ],
        ),
      ),
    );
  }
}
