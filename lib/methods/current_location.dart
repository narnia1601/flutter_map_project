import 'package:geolocator/geolocator.dart';
import 'dart:async';

class CurrentLocation {
  StreamSubscription<Position>? _positionStreamSubscription;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;

  Future<Position> determinePosition() async {
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
