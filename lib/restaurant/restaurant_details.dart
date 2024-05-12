import 'package:flutter/material.dart';

class RestaurantDetails extends StatefulWidget {
  String name;
  String rating;
  String phone;
  String photo;
  String adres;
  String opisanie;

   RestaurantDetails({super.key, required this.name, required this.rating,required this.phone, required this.photo,required this.adres,required this.opisanie,   });

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.photo),
            Text(widget.name),
            Text('рейтинг: ${widget.rating}'),
            
            Text('Aдрес: ${widget.adres}'),
            Text('${widget.opisanie}',style: TextStyle(fontSize: 16),),
            Text('Контакты: ${widget.phone}'),
          ],
        ),
      ),
      
    );
  }
}