// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/services/location_service.dart';
import 'package:weather/services/weather_api_client.dart';
import 'package:weather/util/constant.dart';
import 'package:weather/widgets/additional_inormation.dart';
import 'package:weather/widgets/current_weather.dart';
import 'package:geolocator/geolocator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  WeatherApiClient client = WeatherApiClient();
  Weather? weather;
  late Position position;
  String long = "", lat = "";
  LocationService locationService = LocationService();

  @override
  void initState() {
    setLatLong();
    super.initState();
  }

  setLatLong() async{
    position = await locationService.checkGps();
    lat = position != null ? position.latitude.toString(): defaultLat;
    long = position != null ? position.longitude.toString() : defaultLong;
    setState(() {});
  }

  Future<void> getData() async{
    weather = await client.getCurrentWeatherByLatLong(lat,long);
  }

  @override
  Widget build(BuildContext context) {
  return  Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor:Theme.of(context).primaryColorDark,
        elevation: 0.0,
        title:  Text("Weather App", style: TextStyle(color: Theme.of(context).primaryColorLight),),
        centerTitle: true,
        //leading: IconButton(icon: const Icon(Icons.menu), onPressed: (){}, color:Theme.of(context).primaryColorLight),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentWeather(Icons.wb_sunny_rounded, 
                "${(weather!.temp!.round()- 273).toString()}°C", 
                weather!.cityName!, 
                Colors.yellow),
                const SizedBox(height: 20),
                Text("Additional Information",
                style: TextStyle(
                  fontSize: 20, 
                  color:Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold
                  )),
                const Divider(thickness: 0.5),
                additionalInformation(
                weather!.wind!.toString(), 
                weather!.humidity!.toString(),
                weather!.pressure!.toString(),
                "${(weather!.feelsLike!.round()- 273).toString()}°C", 
                ),
              ],
            ),
          );
          }
          return const Center(child: CircularProgressIndicator());
        })
    );
  }
}
