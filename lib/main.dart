import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/services/weather_api_client.dart';
import 'package:weather/widgets/additional_inormation.dart';
import 'package:weather/widgets/current_weather.dart';
import 'package:location/location.dart';


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
  Location location = Location();

bool _serviceEnabled = false;
PermissionStatus? _permissionGranted;
LocationData? _locationData;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }
   Future<void> _getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {});
  }

  

  Future<void> getData() async{
    weather = await client.getCurrentWeather("Dhaka");
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
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: (){}, color:Theme.of(context).primaryColorLight),
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
                "${weather!.temp!.toString()}°", 
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
                weather!.feelsLike!.toString()
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
