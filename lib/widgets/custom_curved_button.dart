import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class CustomCurvedButton extends StatelessWidget {
  const CustomCurvedButton(
      {this.tittle,
      required this.onPressed,
      required this.buttonheight,
      required this.buttonwidth,
      super.key});
  final String? tittle;
  final VoidCallback onPressed;
  final double buttonwidth;
  final double buttonheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: buttonheight,
      width: MediaQuery.of(context).size.width * buttonwidth,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [signinTheamColor1, signinTheamColor2], // Gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const StadiumBorder(),
          // backgroundColor: signinTheamColor1,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              tittle ?? "",
              style: const TextStyle(
                fontFamily: 'Popins',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
