import 'package:flutter/material.dart';
import 'package:lesson7/Profile.dart';
import 'package:lesson7/login.dart';
import 'package:lesson7/profile14.dart';
import 'package:shared_preferences/shared_preferences.dart';
class regisster extends StatefulWidget {
  const regisster({super.key});

  @override
  State<regisster> createState() => _regissterState();
}

List<String> cities = ['shymkent','almaty','astana','aktau'];
String selectedCity = 'shymkent' ;

class _regissterState extends State<regisster> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('register'),
        backgroundColor: Colors.blue,
      ),
      body: 
          Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'name', 
                  hintText: 'enter name'
                ),
              
              
              
              ),
              TextField(
                decoration: InputDecoration(
                  
                  labelText: 'surename', 
                  hintText: 'enter surename'),
              ),

              TextField(
                decoration: InputDecoration(
                  
                  labelText: 'e-mail', hintText: 'enter e-mail'
                ),
                
              
              
              
              ),
              DropdownButtonFormField(items: cities.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), 
              value: selectedCity,
              onChanged: (newCity){
                selectedCity = newCity!;
              }
              ),
              // ElevatedButton(onPressed: () async{
              //   if (_formKey.currentState!.validate()){
              //           SharedPreferences sp =   await SharedPreferences.getInstance();
              //           sp.setString('key_login' , loginController.text);
              //   Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => profile14()));
              // }, }

              // child:Text('register')),
            ],
          ),   
    );
  }
}