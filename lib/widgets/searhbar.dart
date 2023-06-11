import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class CustomSearchbar extends StatelessWidget {
  const CustomSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      width: MediaQuery.of(context).size.width * .75,
      height: 31,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: TextField(
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: signinTheamColor2,
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: signinTheamColor2,
                  size: 20,
                ),
                onPressed: () {
                  /* Clear the search field */
                },
              ),
              hintText: 'Search...',
              hintStyle:
                  const TextStyle(fontSize: 10.0, color: signinTheamColor2),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
