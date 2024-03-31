import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'info.dart';



class Apilist extends StatefulWidget {
  const Apilist({super.key});

  @override
  State<Apilist> createState() => _ApilistState();
}

class _ApilistState extends State<Apilist> {
  List<String> products = ['apple','banana','cola'];
  List<Info> infoList = [];
  bool listLoading = false;

  void initState (){
    super.initState();

    getInfoList();
  }

  Future getInfoList() async{
    setState(() {
      listLoading = true;
    });
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {

      List<Info> apilist  = List.from(jsonDecode(response.body))
      .map((map)=> Map<String, dynamic>.from(map))
      .map((Map<String,dynamic> map)=> Info.fromJson(map)).toList();

      setState(() {
        infoList = apilist;
      });
      
      infoList.sort(
        ((a, b) => a.id!.compareTo(b.id!))
      );
      setState(() {
        listLoading = false;
      });


      print('vse ok!!!');
    } else {
      throw '4to to ne tak';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API List'),backgroundColor: Colors.greenAccent,
      ),
      body: 
      listLoading == true? Center(child: CircularProgressIndicator()):
      ListView.separated(
        itemCount: infoList.length,
        itemBuilder:(context, index){
          return Padding(
            padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4,right: 10),
            child: Text(
              infoList[index].id.toString()!,
              style: TextStyle(fontSize: 26),),
          );
        },
        separatorBuilder: (BuildContext context,int  index) {
          return Divider(
            thickness: 2,
            height: 0,
          );
          
        },
        ),
    );
  }
}