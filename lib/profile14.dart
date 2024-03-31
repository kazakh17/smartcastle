import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile14 extends StatefulWidget {
  // String login;
  
  profile14({super.key,
   // required this.login,
   

   
   
   } );

  @override
  State<profile14> createState() => _profile14State();
}

class _profile14State extends State<profile14> {
  String login = '';
  @override
  void initState() {
    getLoginFromShared();
    // TODO: implement initState
    super.initState();
  }

  Future getLoginFromShared() async{
    SharedPreferences sp =  await SharedPreferences.getInstance();
    setState(() {
   login =  sp.getString('key_login')! ;   
    });
   


  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: 
        Center(child: 
        Text(
          // widget.login , 
          login,
        style: TextStyle(fontSize: 25 ),),),
        

        
        
      

      );
  }
}