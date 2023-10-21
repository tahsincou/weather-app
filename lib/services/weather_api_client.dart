import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/model/weather.dart';
import 'package:weather/util/constant.dart';


class WeatherApiClient{

  Future<Weather>? getCurrentWeatherByLatLong(String? lat, String? long) async{
      var endPoint= Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiToken");
      var response = await http.get(endPoint);
      var body = jsonDecode(response.body);
      return Weather.fromJson(body);  
  }

   Future<Weather>? getCurrentWeatherLocation(String? location) async{
      var endPoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&APPID=$apiToken");
      var response = await http.get(endPoint);
      var body = jsonDecode(response.body);
      return Weather.fromJson(body);  
  }
}