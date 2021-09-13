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
  void initState() {
    super.initState();
    currentLocation.determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('${currentLocation.latitude}');
          print('${currentLocation.longitude}');
        },
        child: Icon(
          Icons.location_pin,
        ),
      ),
    );
  }
}
