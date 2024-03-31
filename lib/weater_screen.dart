import 'package:flutter/material.dart';
import 'package:lesson7/weather_info.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Прогноз погоды'),backgroundColor: Colors.blue,
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [Colors.blue, Colors.white]
          )

        ),
        child: Column(
          children: [
            SizedBox(height: 70,),
            Text('Погода',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: cityController,
                decoration: InputDecoration(
                hintText: 'Введите город',
                hintStyle: TextStyle(fontSize: 20, color: Colors.white)),),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => weatherInfo(city: cityController.text)));
            }, child: Text('Получить погоду'))
          ],
        ),
      ),
    );
  }
}