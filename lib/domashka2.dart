import 'package:flutter/material.dart';

class Prof extends StatefulWidget {
  const Prof({super.key});

  @override
  State<Prof> createState() => _ProfState();
}

class _ProfState extends State<Prof> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Center(child: Image.network('https://w7.pngwing.com/pngs/799/805/png-transparent-madagascar-animals-to-pull-material-free-flat-animation-cartoon.png',height: 200,width: 200,)),
          SizedBox(height: 100,),
          Row(
            children: [
              ElevatedButton(onPressed: (){},style: 
              ElevatedButton.styleFrom(backgroundColor: Colors.amber), child: Text('SIGN IN')),
              
            ],
          ),
        ],
      ),
    );
  }
}