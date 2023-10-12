import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/model/weather.dart';


class WeatherApiClient{

  Future<Weather>? getCurrentWeather(String? location) async{
      var enPoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&APPID=eaf0fa7acda09fcd8d7f8179161f6e72");
      var response = await http.get(enPoint);
      var body = jsonDecode(response.body);
      return Weather.fromJson(body);  
  }
}