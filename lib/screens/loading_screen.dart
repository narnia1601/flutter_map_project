import 'package:flutter/material.dart';
import 'package:flutter_map_project/screens/map_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_map_project/methods/current_location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    CurrentLocation currentLocation = CurrentLocation();
    var currentLocationData = await currentLocation.determinePosition();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MapScreen(currentLocationData: currentLocationData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        body: Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
