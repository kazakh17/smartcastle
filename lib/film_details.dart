import 'package:flutter/material.dart';

class FilmDetails extends StatefulWidget {
  String image;
  String name;
  String genre;
  double rating;
  String description;
  FilmDetails({
    super.key,
    required this.image,
    required this.name,
    required this.genre,
    required this.rating,
    required this.description,
  });

  @override
  State<FilmDetails> createState() => _FilmDetailsState();
}

class _FilmDetailsState extends State<FilmDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('О фильме'),
      ),
      body: Column(
        children: [
          Center(
            child: Image.network(
              widget.image,
              width: 150,
              height: 150,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Название фильма:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 10),
              Text(
                widget.name,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Жанр:', style: TextStyle(fontSize: 16)),
              SizedBox(width: 10),
              Text(
                widget.genre,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Рейтинг:', style: TextStyle(fontSize: 16)),
              SizedBox(width: 10),
              Text(
                widget.rating.toString(),
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Text(widget.description),
        ],
      ),
    );
  }
}
