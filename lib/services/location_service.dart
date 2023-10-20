

// ignore_for_file: avoid_print

import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationService{
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;
   checkGps() async {
      servicestatus = await Geolocator.isLocationServiceEnabled();
      if(servicestatus){
            permission = await Geolocator.checkPermission();
            if (permission == LocationPermission.denied) {
                permission = await Geolocator.requestPermission();
                if (permission == LocationPermission.denied) {
                    print('Location permissions are denied');
                }else if(permission == LocationPermission.deniedForever){
                    print("'Location permissions are permanently denied");
                }else{
                   haspermission = true;
                }
            }else{
               haspermission = true;
            }
            if(haspermission){
                 position= await getLocation();
                 return position;
            }
      }
  }
   Future<Position> getLocation() async {
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457
      long = position.longitude.toString();
      lat = position.latitude.toString();

      LocationSettings locationSettings = const LocationSettings(accuracy: LocationAccuracy.high, distanceFilter: 100);
      StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
            locationSettings: locationSettings).listen((Position position) {
            long = position.longitude.toString();
            lat = position.latitude.toString();
      });
      return position;
  }

}