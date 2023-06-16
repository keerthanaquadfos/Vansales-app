import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:van_sales_app/widgets/custom_app_bar.dart';

import '../add_shop/add_shop/add_shop_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controllerMap = Completer();
  static const CameraPosition initialPosition =
      CameraPosition(target: LatLng(10.4762519, 76.2158637), zoom: 14.0);
  static const CameraPosition targetPosition =
      CameraPosition(target: LatLng(10.0017012, 76.3800595), zoom: 20.0);

  AddShopController addShopControllerMap = Get.put(AddShopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleOnltyCustomAppBar(title: "Map"),
      body: GoogleMap(
        myLocationEnabled: true, myLocationButtonEnabled: true,
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controllerMap.complete(controller);
        },
        //marks////////
        markers: Set<Marker>.from(markers),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        //  () async {
        //   //  GoogleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat!, lon!),zoom: 20)));
        //   markers.clear();
        //   markers.add(Marker(
        //       markerId: const MarkerId("current location"),
        //       position: LatLng(lat!, lon!)));
        // },
        label: const Text('Current Location !'),
        icon: const Icon(Icons.location_searching),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controllerMap.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(addShopControllerMap.latitudeCurrent.value,
            addShopControllerMap.longitudeCurrent.value),
        zoom: 20)));
    print(
        "${addShopControllerMap.latitudeCurrent.value},${addShopControllerMap.longitudeCurrent.value}");
  }

  List<Marker> markers = [
    const Marker(
      markerId: MarkerId('marker1'),
      position: LatLng(10.010209077133998, 76.36407360084966),
      icon: BitmapDescriptor.defaultMarker, // Default marker icon
    ),
    const Marker(
      markerId: MarkerId('marker2'),
      position: LatLng(10.00709290623097, 76.37387900463092),
      icon: BitmapDescriptor.defaultMarker,

      /// Custom icon asset
    ),
    // Add current location marker if available
  ];
}
