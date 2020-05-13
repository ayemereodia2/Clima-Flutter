import 'package:clima/weather_data.dart';
import 'package:flutter/material.dart';

import '../services/weather.dart';
import '../services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    navigateToNextPage();
  }

  void navigateToNextPage() async {
    WeatherModel model = WeatherModel();
    var weatherData =  await model.getLocation();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(
        weatherData: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }
}
