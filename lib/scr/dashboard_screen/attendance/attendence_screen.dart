import 'package:flutter/material.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';
import 'package:van_sales_app/widgets/custom_curved_button.dart';
import 'package:van_sales_app/widgets/custom_textfeild.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final TextEditingController _controllerOdometer = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Attendance"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomCurvedButton(
              tittle: "Download Sales Closing Sheet",
              onPressed: () {},
              buttonheight: 50,
              buttonwidth: .7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCurvedButton(
                  tittle: "Odometer Reading",
                  onPressed: () {},
                  buttonheight: 60,
                  buttonwidth: .4),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: CustomTextFielBox(
                        controller: _controllerOdometer, text: "")),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCurvedButton(
                  tittle: "Punch in",
                  onPressed: () {},
                  buttonheight: MediaQuery.of(context).size.height * .2,
                  buttonwidth: .4),
              CustomCurvedButton(
                  tittle: "Punch out",
                  onPressed: () {},
                  buttonheight: MediaQuery.of(context).size.height * .2,
                  buttonwidth: .4),
            ],
          ),
          const Text("Punched in at ")
        ],
      ),
    );
  }
}
