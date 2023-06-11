import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:van_sales_app/utils/custom_colors.dart';

import '../scr/dashboard_screen/dashboard_screen.dart';

class TileContainer extends StatefulWidget {
  // final IconData icon;

  final TileGridModel reportTiledata;

  const TileContainer({super.key, required this.reportTiledata});

  @override
  State<TileContainer> createState() => _TileContainerState();
}

class _TileContainerState extends State<TileContainer> {
  ContainerController containerController = Get.put(ContainerController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        containerController.setSelectedMenuItem(widget.reportTiledata);
        containerController.isSelectedMenuItem(widget.reportTiledata);
      },
      onTapUp: (details) {
        containerController.removeSelection();
        containerController.isSelectedMenuItem(widget.reportTiledata);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => widget.reportTiledata.reportpage),
        );
      },
      child: Obx(
        () => Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: containerController.isClicked.isTrue &&
                      widget.reportTiledata.id ==
                          containerController.selectedMenuId
                  ? const LinearGradient(
                      colors: [signinTheamColor1, signinTheamColor2],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  : const LinearGradient(
                      colors: [dashTileColor, dashTileColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.reportTiledata.imagrUrl,
                height: 60,
                width: 60,
              ),
              const SizedBox(height: 2.0),
              Text(
                widget.reportTiledata.title,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerController extends GetxController {
  int? selectedMenuId;
  final isClicked = false.obs;

  void setSelectedMenuItem(TileGridModel reportTiledata) {
    selectedMenuId = reportTiledata.id;
  }

  void removeSelection() {
    selectedMenuId = null;
  }

  bool isSelectedMenuItem(TileGridModel reportTiledata) {
    if (selectedMenuId == null) {
      isClicked.value = false;
      return false;
    }
    if ((selectedMenuId) == reportTiledata.id!) {
      isClicked.value = true;
      return true;
    }
    isClicked.value = false;
    return false;
  }

  void clicked(bool select) {
    isClicked.value = select;
  }
}
