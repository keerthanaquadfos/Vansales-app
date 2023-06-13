import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';

import '../add_expense/add_expense.dart';

class ExpenseManagement extends StatefulWidget {
  const ExpenseManagement({super.key});

  @override
  State<ExpenseManagement> createState() => _ExpenseManagementState();
}

class _ExpenseManagementState extends State<ExpenseManagement> {
  double totalexpense = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleOnltyCustomAppBar(
        title: "Expense Management",
        onBackTap: () => Get.back(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCurvedButton(
                  tittle: "Previous",
                  onPressed: () {
                    Get.to(const ExpenseManagement());
                  },
                  buttonheight: 40,
                  buttonwidth: MediaQuery.of(context).size.width * 1),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomCurvedButton(
                    tittle: "Add Expense",
                    onPressed: () {
                      Get.to(const AddExpenseScreen());
                    },
                    buttonheight: 40,
                    buttonwidth: MediaQuery.of(context).size.width * 1),
              ),
              // CustomCurvedButton(
              //     tittle: "Upload Expense",
              //     onPressed: () {
              //       Get.to(const ExpenseManagement());
              //     },
              //     buttonheight: 40,
              //     buttonwidth: MediaQuery.of(context).size.width * 1),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Total Expense : $totalexpense",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
