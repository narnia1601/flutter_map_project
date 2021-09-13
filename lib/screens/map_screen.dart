import 'package:flutter_map_project/methods/current_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  final currentLocationData;
  MapScreen({required this.currentLocationData});
  @override
  _MapScreenState createState() => _MapScreenState();
}

double latitude = currentLocation.latitude;
double longitude = currentLocation.longitude;

CurrentLocation currentLocation = CurrentLocation();

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    updateUI(widget.currentLocationData);
  }

  void updateUI(dynamic currentLocationData) async {
    setState(() {
      latitude = currentLocationData.latitude;
      longitude = currentLocationData.longitude;
    });
    CameraPosition userCurrentLocation =
        CameraPosition(target: LatLng(latitude, longitude), zoom: 14.4746);
    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(userCurrentLocation));
  }

  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(latitude, longitude),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: cameraPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
