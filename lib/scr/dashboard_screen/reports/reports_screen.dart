import 'package:flutter/material.dart';
import 'package:van_sales_app/scr/dashboard_screen/reports/customer_ledger_report/customer_ledger_report_screen.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import '../../../utils/custom_colors.dart';
import '../../../widgets/tile_container.dart';
import '../dashboard_screen.dart';
import 'cash_egister_report/cash_register_report_screen.dart';
import 'category_report/category_report_screen.dart';
import 'customer_ledger_summary_report/ledger_summary_report_screen.dart';
import 'stock_register_report/stock_register_report_screen.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TitleOnltyCustomAppBar(title: "Reports"),
        body: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          height: MediaQuery.of(context).size.height * 0.85,
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
          child: const SingleChildScrollView(
            child: Column(
              children: [SizedBox(height: 500, child: ReportGrid())],
            ),
          ),
        ));
  }
}

class ReportGrid extends StatefulWidget {
  const ReportGrid({super.key});

  @override
  State<ReportGrid> createState() => _ReportGridState();
}

class _ReportGridState extends State<ReportGrid> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .88,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // childAspectRatio: 1.0,
        ),
        itemBuilder: (context, index) {
          return TileContainer(
            reportTiledata: reporGridtlist[index],
          );
        },

        itemCount: reporGridtlist.length,
        shrinkWrap: true, // Set shrinkWrap to true
      ),
    );
  }
}

final List<TileGridModel> reporGridtlist = [
  TileGridModel(
      id: 0,
      imagrUrl: "assets/images/schedules_Icons-09.png",
      title: "Order Report",
      reportpage: const ReportsScreen()),
  TileGridModel(
      id: 1,
      imagrUrl: "assets/images/add_client_Icons-10.png",
      title: 'Sales Report',
      reportpage: const ReportsScreen()),
  TileGridModel(
      id: 2,
      imagrUrl: "assets/images/overdues_Icons-11.png",
      title: 'Sales Return register',
      reportpage: const ReportsScreen()),
  TileGridModel(
      id: 3,
      imagrUrl: "assets/images/product_Icons-12.png",
      title: 'Expenses \nReport',
      reportpage: const ReportsScreen()),
  TileGridModel(
      id: 4,
      imagrUrl: "assets/images/expenses_Icons-13.png",
      title: 'Sales Summary Report',
      reportpage: const ReportsScreen()),
  TileGridModel(
      id: 5,
      imagrUrl: "assets/images/incentives_Icons-14.png",
      title: 'Stock Register Report',
      reportpage: const StockRegisterReportScreen()),
  TileGridModel(
    id: 6,
    imagrUrl: "assets/images/new_arrival_Icons-15.png",
    title: 'Item Category Report',
    reportpage: const CategoryReportScreen(),
  ),
  TileGridModel(
    id: 7,
    imagrUrl: "assets/images/branding_material_Icons-16.png",
    title: 'Customer Ledger',
    reportpage: const CustomerLedgerReport(),
  ),
  TileGridModel(
    id: 8,
    imagrUrl: "assets/images/activities_Icons-17.png",
    title: 'Cash Register Report',
    reportpage: const CashRegisterreportScreen(),
  ),
  TileGridModel(
    id: 9,
    imagrUrl: "assets/images/offer_Icons-18.png",
    title: 'Ledger Summary',
    reportpage: const LedgerSummaryReport(),
  ),
];
