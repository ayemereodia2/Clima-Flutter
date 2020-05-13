import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter/material.dart';
import '../screens/location_screen.dart';
import 'package:clima/weather_data.dart';
class WeatherModel {
  String getWeatherIcon(int condition) {
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

  String getMessage(int temp) {
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

  Future<WeatherData> getLocation() async {

    Location location = Location();

    await location.getCurrentLocation();
    double temperature = 0;
    int condition = 0;
    String cityName = '';

     await Networking.shared.getData(latitude: location.latitude, longitude: location.longitude, parseDate: (dynamic jsonResponse){
       temperature = jsonResponse['main']['temp'];
       condition = jsonResponse['weather'][0]['id'];
       cityName = jsonResponse['name'];
    });

    return WeatherData(temperature:temperature,condition:condition, city:cityName);

  }


  Future<WeatherData> getWeatherByCityName(String cityName) async {

    double temperature = 0;
    int condition = 0;
    String city = '';
    print(cityName);
    await Networking.shared.getDataByCityName(cityName: cityName, parseDate: (dynamic jsonResponse){
      temperature = jsonResponse['main']['temp'];
      condition = jsonResponse['weather'][0]['id'];
      city = jsonResponse['name'];
    });

    return WeatherData(temperature:temperature,condition:condition, city:cityName);

  }

}
