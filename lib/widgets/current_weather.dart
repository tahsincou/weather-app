import 'package:flutter/material.dart';

Widget currentWeather(IconData icon, String temp, String location, Color color){
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 80),
          const SizedBox(height: 10),
          Text(temp, style: const TextStyle(fontSize: 18, color: Colors.black)),
          const SizedBox(height: 10),
          Text(location, style: const TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    ),
  );
}