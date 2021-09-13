import 'package:flutter_map_project/methods/current_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

CurrentLocation currentLocation = CurrentLocation();

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    currentLocation.determinePosition();
  }

  void determinePosition() async {
    await currentLocation.determinePosition();
  }

  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(currentLocation.latitude, currentLocation.longitude),
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
