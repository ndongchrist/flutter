import 'package:flutter/material.dart';
import 'package:test/services/location.dart';
import 'package:test/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  String url = "";

  void getCurrentLocationData() async {
    Location newLocation = Location();
    await newLocation.getCurrentLocation();
    latitude = newLocation.latitude;
    longitude = newLocation.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=52cd5705d8d3383de1c55d90adf0c2e6&units=metric");

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  final spinkit = SpinKitFadingCircle(
    color: Colors.blue,
    size: 100.0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocationData();
  }

  void getweather() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: spinkit,
      ),
    );
  }
}
