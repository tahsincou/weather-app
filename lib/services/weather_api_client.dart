import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/model/weather.dart';


class WeatherApiClient{

  Future<Weather>? getCurrentWeatherByLatLong(String? lot, String? long) async{
      var endPoint= Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=37.4219983&lon=-122.084&appid=eaf0fa7acda09fcd8d7f8179161f6e72");
      var response = await http.get(endPoint);
      var body = jsonDecode(response.body);
      return Weather.fromJson(body);  
  }

   Future<Weather>? getCurrentWeatherLocation(String? location) async{
      var endPoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&APPID=eaf0fa7acda09fcd8d7f8179161f6e72");
      var response = await http.get(endPoint);
      var body = jsonDecode(response.body);
      return Weather.fromJson(body);  
  }
}