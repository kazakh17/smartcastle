

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson7/weater_model.dart';

class weatherInfo extends StatefulWidget {
  String city;
  weatherInfo({super.key, required this.city});

  @override
  State<weatherInfo> createState() => _weatherInfoState();
}

class _weatherInfoState extends State<weatherInfo> {
double temp = 0.0;
String state = '';
String image = '';

void initState() {
  super.initState();
  gerWeather();
}




Future gerWeather ( ) async {
  final response=await http.get(Uri.parse(
    'https://api.openweathermap.org/data/2.5/weather?q=${widget.city}&appid=1369dd6b5ae78fc9952261ab9aa236b4&units=metric'));
  if (response.statusCode == 200) {
    WeaterModel weaterModel = 
    WeaterModel.fromJson(jsonDecode(response.body));

    setState(() {
      temp = weaterModel.main!.temp!;
      state = weaterModel.weather!.first.main!;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
          Text(widget.city,
          style: TextStyle(fontSize: 24),),
          Text('$temp°C ',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
          SizedBox(height: 20),
          Text(state)

        ]),
      ),
    );
  }
}