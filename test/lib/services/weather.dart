import 'package:test/services/location.dart';
import 'package:test/services/networking.dart';
import 'package:test/screens/loading_screen.dart';

class WeatherModel {
  Future getCurrentCityData(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=52cd5705d8d3383de1c55d90adf0c2e6&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getLocationWeather() async {
    Location newLocation = Location();
    await newLocation.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=${newLocation.latitude}&lon=${newLocation.longitude}&appid=52cd5705d8d3383de1c55d90adf0c2e6&units=metric");

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(var condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(var temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
