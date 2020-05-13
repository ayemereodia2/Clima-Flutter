import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'dart:convert' as convert;
import '../utilities/constants.dart';

class Networking {
  static Networking shared = Networking();
   Networking();

  Future<void> getData({double latitude, double longitude, @required Function parseDate}) async {
    String cityName = 'Lagos';
    String urlPosition = openWeatherMapUrl+'lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    String url = '$openWeatherMapUrl=$cityName&appid=$apiKey&units=metric';
    var response = await http.get(urlPosition);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);
      print(response.body);
      parseDate(jsonResponse);
    }else{
      print(response.statusCode);
    }
  }



  Future<void> getDataByCityName({String cityName, @required Function parseDate}) async {
    String url = openCityWeatherMapUrl+cityName+'&appid='+apiKey+'&units=metric';
    print(url);
    var response = await http.get(url);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);
      print(response.body);
      parseDate(jsonResponse);
    }else{
      print(response.statusCode);
    }
  }
}