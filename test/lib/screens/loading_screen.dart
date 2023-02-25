import 'package:flutter/material.dart';
import 'package:test/services/weather.dart';
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

  Future<dynamic> getCurrentLocationData() async {
    WeatherModel weathermodel = WeatherModel();
    var weatherData = await weathermodel.getLocationWeather();

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
