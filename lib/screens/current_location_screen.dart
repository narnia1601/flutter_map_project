import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  StreamSubscription<Position>? _positionStreamSubscription;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _determinePosition();
        },
        child: Icon(
          Icons.location_pin,
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final positionStream = _geolocatorPlatform.getPositionStream();
    _positionStreamSubscription = positionStream.handleError((error) {
      _positionStreamSubscription?.cancel();
      _positionStreamSubscription = null;
    }).listen((position) {});
    double latitude = position.latitude;
    double longitude = position.longitude;
    print(latitude);
    print(longitude);
    return position;
  }
}
