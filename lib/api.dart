import 'package:flutter/material.dart';
import 'package:lesson7/info.dart';
import 'package:http/http.dart';
class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {

  // Future<Info> getInfo()async{
  //   final response = await 

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api'),backgroundColor: Colors.green,
      ),
    );
  }
}