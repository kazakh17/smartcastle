import 'package:flutter/material.dart';

class Lesson77 extends StatefulWidget {
  const Lesson77({super.key});

  @override
  State<Lesson77> createState() => _Lesson77State();
}

class _Lesson77State extends State<Lesson77> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text ('Вторая страница'),backgroundColor: Colors.blue,
      ),
      body: Column (
        children: [
          SizedBox(height: 20,),
          Text('Hello',style: TextStyle (fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox (
              width: double.infinity,
            ),
          ),

          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, 
          child: Text ('Вернуться назад'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          ),),
        ],
      ),
    );
  }
}