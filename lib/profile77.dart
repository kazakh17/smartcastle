// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson7/info2.dart';

class Profile77 extends StatefulWidget {
  const Profile77({super.key});

  @override
  State<Profile77> createState() => _Profile77State();
}

class _Profile77State extends State<Profile77> {
  String name = '';
  String city = '';
  String street = '';
  bool Profileloading = false;

  void initState(){
    super.initState();

    getProfile();
  }

  Future getProfile() async {
    setState(() {
      Profileloading = true;
    });
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

    if (response.statusCode == 200) {
      Info info2 = Info.fromJson(jsonDecode(response.body));

      setState(() {
        name = info2.name!;
        city = info2.address!.city!;
        street = info2.address!.street!;
      });
      setState(() {
        Profileloading = false;
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green,
      ),
      body: 

    Profileloading == true!?
    Center(child: CircularProgressIndicator()):
      
      
      
      Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.mds.yandex.net/get-kinopoisk-image/4303601/08468155-8b49-4004-827c-f6abbbb00114/600x900'),
              radius: 80,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(name),
          Text(city),
          Text(street),
        ],
      ),
    );
  }
}
