import 'package:geolocator/geolocator.dart';
import 'dart:async';

class CurrentLocation {
  StreamSubscription<Position>? _positionStreamSubscription;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  double latitude = 0;
  double longitude = 0;

  Future<Position> determinePosition() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final positionStream = _geolocatorPlatform.getPositionStream();
    _positionStreamSubscription = positionStream.handleError((error) {
      _positionStreamSubscription?.cancel();
      _positionStreamSubscription = null;
    }).listen((position) {
      latitude = position.latitude;
      longitude = position.longitude;
    });
    return position;
  }
}
