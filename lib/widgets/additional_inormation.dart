import 'package:flutter/material.dart';

TextStyle titleFont = const TextStyle(fontWeight: FontWeight.w500, fontSize: 16);
TextStyle infoFont = const TextStyle(fontWeight: FontWeight.w400, fontSize: 14);

Widget additionalInformation(String wind,String humidity ,String pressure,String feelsLike ){
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Wind", style: titleFont),
                const SizedBox(height: 18),
                Text("Pressure", style: titleFont),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(wind, style: infoFont),
                const SizedBox(height: 18),
                Text(pressure, style: infoFont),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Humidity", style: titleFont),
                const SizedBox(height: 18),
                Text("Feels Like", style: titleFont),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(humidity, style: infoFont),
                const SizedBox(height: 18),
                Text(feelsLike, style: infoFont),
              ],
            ),
            
          ],
        ),
      ],
    ),
  );
}