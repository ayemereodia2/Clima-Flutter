import 'package:geolocator/geolocator.dart';

class Location {
    double latitude = 0;
    double longitude = 0;


  Future<void> getCurrentLocation() async {
    try{
      Position position =  await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      if(position == null){
        latitude = 0;
        longitude = 0;
        return;
      }
    }
    catch(e){
      double _latitude = -1;
      double _longitude = -1;
      print(e);
    }
  }
}