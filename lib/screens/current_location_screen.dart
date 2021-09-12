import 'package:flutter/material.dart';
import 'package:flutter_map_project/methods/current_location.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({Key? key}) : super(key: key);

  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  CurrentLocation currentLocation = CurrentLocation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          currentLocation.determinePosition();
        },
        child: Icon(
          Icons.location_pin,
        ),
      ),
    );
  }
}
