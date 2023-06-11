import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class SignInButtonTile extends StatelessWidget {
  const SignInButtonTile({this.tittle, required this.onPressed, super.key});
  final String? tittle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 175,
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
