import 'package:flutter/material.dart';

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
