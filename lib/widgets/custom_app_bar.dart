import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;
  final VoidCallback? onMenuTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackTap,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: dashAppBarColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: dashAppBarItemColor,
            size: 35,
          ),
          onPressed: onBackTap,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          title,
          style: const TextStyle(
              color: dashAppBarItemColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: IconButton(
            icon: const Icon(
              Icons.menu,
              color: dashAppBarItemColor,
              size: 35,
            ),
            onPressed: onMenuTap,
          ),
        ),
      ],
      elevation: 0.0, // Set elevation to 0 to remove the shadow line
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class TitleOnltyCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;
  const TitleOnltyCustomAppBar({
    super.key,
    required this.title,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: dashAppBarColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: dashAppBarItemColor,
            size: 30,
          ),
          onPressed: onBackTap,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          title,
          style: const TextStyle(
              color: dashAppBarItemColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),

      elevation: 0.0, // Set elevation to 0 to remove the shadow line
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearchOnltyCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  //final String title;
  final VoidCallback? onBackTap;
  const SearchOnltyCustomAppBar({
    super.key,
    //required this.title,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: dashAppBarColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: dashAppBarItemColor,
            size: 30,
          ),
          onPressed: onBackTap,
        ),
      ),
      title: Container(
        // margin: const EdgeInsets.only(left: 10),
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(0, 20, 10, 20),
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
                  color: searchBoxItemsColor,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: searchBoxItemsColor,
                    size: 20,
                  ),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                hintStyle:
                    const TextStyle(fontSize: 10.0, color: searchBoxItemsColor),
                border: InputBorder.none),
          ),
        ),
      ),

      elevation: 0.0, // Set elevation to 0 to remove the shadow line
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
