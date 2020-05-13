import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const kInputDecoration =  InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city),
  hintText: 'Enter city name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
);
const String apiKey = '64ac03ccd32ad98626331333f7636202';
const String openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather?';
const String openCityWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather?q=';