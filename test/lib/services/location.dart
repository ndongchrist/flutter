import 'package:geolocator/geolocator.dart';

class Location {
  Location({this.Latitude, this.Longitude});

  double? Latitude;
  double? Longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {}
  }
}
