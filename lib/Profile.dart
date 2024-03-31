import 'package:flutter/material.dart';
import 'package:lesson7/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  String name;
  String familya;
  String Ot4estvo;
  String emeil;
  String phone;
  String city;
  Profile(
      {super.key,
      required this.name,
      required this.familya,
      required this.Ot4estvo,
      required this.emeil,
      required this.phone,
      required this.city});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? login = '';

  @override
  void initState() {
    super.initState();

    getFromShared();
  }

  Future getFromShared() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      login = sp.getString('Login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Color.fromARGB(255, 73, 60, 209),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage ('https://avatars.mds.yandex.net/get-kinopoisk-image/4303601/08468155-8b49-4004-827c-f6abbbb00114/600x900'),
              radius: 80,
            ),
          ),
          
          SizedBox(
            height: 10,
          ),
          Text(
            widget.name,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.familya,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.Ot4estvo,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.city,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.emeil,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.phone,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: 100,
                            child: Column(
                              children: [
                                Text('Если хотите выйти то нажмите да'),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Да')),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Нет')),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Text(
                'Выйти',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              ElevatedButton(
                
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: (){
                  ScaffoldMessenger.of(
                    context).showSnackBar(SnackBar(
                      backgroundColor: Colors.amber,
                      duration: Duration(seconds: 10),
                      content: 
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(Icons.accessibility_new_rounded),
                      Center(child: Text('Всем привет',style: TextStyle(color: Colors.black),)),
                    ],
                  )));
                }, child: Text ('show snackbar')),

        ],
      ),
    );
  }
}
