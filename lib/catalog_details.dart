import 'package:flutter/material.dart';

class CatalogDetails extends StatefulWidget {
  String  image;
  String  title;
  String  price;

  CatalogDetails({super.key, 
  required this.image,
  required this.title,
  required this.price,


  
  });
  

  @override
  State<CatalogDetails> createState() => _CatalogDetailsState();
}

class _CatalogDetailsState extends State<CatalogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text (widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(widget.image),
          ),
          Text(
            widget.title, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          
          Text(widget.price, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

        ],
      ),
    );
  }
}