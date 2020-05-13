import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import '../services/weather.dart';
import '../services/weather.dart';
import '../services/weather.dart';
import 'package:clima/weather_data.dart';
import '../screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  final WeatherData weatherData;
//  final double temperature;
//  final int condition;
//  final String name;
  LocationScreen({this.weatherData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weatherModel = WeatherModel();
@override
  void initState() {
    // TODO: implement initState
    updateUI(widget.weatherData);
  }

  void updateUI(WeatherData data){
    setState(() {
      var tem = data.temperature;
      temp = tem.toInt();
      name = data.city;
      condition = data.condition;
    });
  }

  int temp = 0;
  String name = '';
  int condition = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocation();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                String cityName =  await Navigator.push(context, MaterialPageRoute(builder:(context){
                        return CityScreen();
                      }));

                    if(cityName != null){
                      var weatherData = await weatherModel.getWeatherByCityName(cityName);
                      updateUI(weatherData);
                    }

                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                       '$temp ° ',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherModel.getWeatherIcon(condition),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  weatherModel.getMessage(temp)+' in '+name,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
