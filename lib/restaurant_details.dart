import 'package:flutter/material.dart';

class RestaurantDetails extends StatefulWidget {
  String name;
  String rating;
  String phone;
   RestaurantDetails({super.key, required this.name, required this.rating,required this.phone,  });

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text (widget.name),backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Stack(
          //   children: [
          //     Image.network(widget.image),
              
          //     Positioned(
          //       top: 10,
          //       right: 10,
          //       child: Text(widget.rating, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),))
          //   ],
          // ),
          Text(widget.name),
          Text('рейтинг: ${widget.rating}'),
          Text('phone: ${widget.phone}'),
          

        ],
      ),
      
    );
  }
}