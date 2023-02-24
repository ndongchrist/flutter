import 'package:flutter/material.dart';
import 'package:test/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void getCurrentLocation() async {
    Location newLocation = Location();
    await newLocation.getCurrentLocation();
    print(newLocation.Latitude);
    print(newLocation.Longitude);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
    getweather();
  }

  void getweather() async {
    var url = Uri.https('api.openweathermap.org/',
        'data/2.5/weather?lat=25&lon=139&appid=52cd5705d8d3383de1c55d90adf0c2e6');
    Response reponse = await get(url);
    if (reponse.statusCode == 200) {
      var data = reponse.body;
      print(data);
    } else {
      print(reponse.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
