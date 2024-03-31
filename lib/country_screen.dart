import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson7/country_model.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();

  
}

class _CountryScreenState extends State<CountryScreen> {

  List <CountryModel> countries =[];

  @override
  void initState() {
    super.initState();
    getCountries();
  }


Future getCountries()async{
   final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));
   if (response.statusCode == 200){
    List <CountryModel> countriesList = List.from(jsonDecode(response.body)).map((map)=>Map<String, dynamic>.from(map))
    .map((Map<String, dynamic> map) => CountryModel.fromJson(map))
    .toList();

    setState(() {
      countries = countriesList;
      countries.sort(((a, b) => a.name!.common!.compareTo(b.name!.common!)));
    });





   }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country'),backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index){
          return ExpansionTile(
            leading: 
            CircleAvatar(
              backgroundImage: NetworkImage((countries[index].flags!.png!)),
            ),

            title: Text(countries[index].name!.common!),
            children: [
              Text('Столица:${(countries[index].capital!.first)}'),
              Text('Население:${(countries[index].population)} чел'),
              Text('Площадь:${(countries[index].area)} км2')], );
          }),

          
          
    );
          }
}
    