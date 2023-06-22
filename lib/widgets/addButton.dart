import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/widgets/custom_dropdown.dart';

import '../scr/dashboard_screen/new_order/store_keeper/recent_orders/order_details/order_details_sceen.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // Button action for the "Add" functionality
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Colors.green), // Set the desired background color for the button
        ),
        child: const Icon(Icons.add));
  }
}

class RemoveButton extends StatelessWidget {
  const RemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // Button action for the "Add" functionality
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Colors.red), // Set the desired background color for the button
        ),
        child: const Text(
          "-",
          style: TextStyle(fontSize: 30),
        ));
  }
}

class TableButton extends StatelessWidget {
  const TableButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Get.to(const OrderDetailsScreen());
          // Button action for the "Add" functionality
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 151, 90,
                  143)), // Set the desired background color for the button
        ),
        child: const Text(
          "Details",
          style: TextStyle(fontSize: 12, color: Colors.white),
        ));
  }
}

class ConfirmedTableButton extends StatelessWidget {
  const ConfirmedTableButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showVanAssignPopup(context);
          // Button action for the "Add" functionality
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 151, 90,
                  143)), // Set the desired background color for the button
        ),
        child: const Text(
          "Assign Van",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ));
  }

  void showVanAssignPopup(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Van'),
        content: CustemDropdown(
          boxwidth: .4,
          itemcount: 5,
          itemlist: vanList,
          texthint: "Select Van",
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Clear the text field

              Navigator.pop(context, 'Submit');
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class DetailsButton extends StatelessWidget {
  const DetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          // Button action for the "Add" functionality
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 152, 42,
                  216)), // Set the desired background color for the button
        ),
        child: const Text(
          "Details",
          style: TextStyle(fontSize: 12, color: Colors.white),
        ));
  }
}

final List<DropDownValueModel> vanList = [
  const DropDownValueModel(name: 'Vav 1', value: "van1"),
  const DropDownValueModel(name: 'Vav 2', value: "van2"),
  const DropDownValueModel(name: 'Vav 3', value: "van3"),
  const DropDownValueModel(name: 'Vav 4', value: "van4"),
  const DropDownValueModel(name: 'Vav 5', value: "van5"),
];
