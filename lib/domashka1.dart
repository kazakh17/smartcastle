import 'package:flutter/material.dart';

class Vhod extends StatefulWidget {
  const Vhod({super.key});

  @override
  State<Vhod> createState() => _VhodState();
}

class _VhodState extends State<Vhod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Login'),backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10,top: 220,bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Your Email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  )
              ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10,left: 10,top: 10,bottom: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  )
              ),
              ),
          ),
          ElevatedButton(onPressed: (){}, child: Text('SIGN UP')),
        ],
      ),
    );
  }
}