import 'package:flutter/material.dart';

class ReceptDetails extends StatefulWidget {
  String name;
  String image;
  String rating;
  String cookTime;
  List<String> ingredients;
  String kuhnya;



  ReceptDetails({super.key, 
  required this.name,
  required this.image,
  required this.rating,
  required this.cookTime,
  required this.ingredients,
  required this.kuhnya,
  });

  @override
  State<ReceptDetails> createState() => _ReceptDetailsState();
}

class _ReceptDetailsState extends State<ReceptDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text (widget.name),backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(widget.image),
              
              Positioned(
                top: 10,
                right: 10,
                child: Text(widget.rating, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),))
            ],
          ),
          Text(widget.name),
          Text('рейтинг: ${widget.rating}'),
          Text('Время приготовление: ${widget.cookTime} минут'),
          Text(widget.kuhnya),
          Text('Ингредиенты:'),

          ListView.builder(
            itemCount: widget.ingredients.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return Text(widget.ingredients[index]);

            }),
          

        ],
      ),
      
    );
  }
}