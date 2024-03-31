import 'package:flutter/material.dart';
import 'package:lesson7/film_details.dart';

class Lesson101 extends StatefulWidget {
  const Lesson101({super.key});

  @override
  State<Lesson101> createState() => _Lesson101State();
}

class _Lesson101State extends State<Lesson101> {
  List<Film> films = [
    Film(
        'avatar',
        'https://e7.pngegg.com/pngimages/767/193/png-clipart-avatar-avatar.png',
        'fantazy',
        10, 'Описание'),
    Film(
        'madagaskar',
        'https://w7.pngwing.com/pngs/799/805/png-transparent-madagascar-animals-to-pull-material-free-flat-animation-cartoon.png',
        'muiltik',
        9, '.opisanie'),
    Film(
        'flash',
        'https://e7.pngegg.com/pngimages/1001/868/png-clipart-adobe-flash-flash-superhero-fictional-character-thumbnail.png',
        'fantazy',
        7, 'opisanie'),
    Film(
        'spiderman',
        'https://upload.wikimedia.org/wikipedia/en/e/e1/Spider-Man_PS4_cover.jpg',
        'fantazy',
        5, 'opisanie'),
  ];

  var ratingColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('films'),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: films.length,
          itemBuilder: (context, index) {
            if (films[index].rating > 8) {
              ratingColor = Colors.green;
            } else {
              ratingColor = Colors.red;
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilmDetails(
                                image: films[index].image,
                                name: films[index].name,
                                genre: films[index].zhanr,
                                rating: films[index].rating,
                                description: films[index].description,
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25)),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.network(
                        films[index].image,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            films[index].name,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            films[index].zhanr,
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            films[index].rating.toString(),
                            style: TextStyle(fontSize: 15, color: ratingColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class Film {
  String name;
  String image;
  String zhanr;
  double rating;
  String description;

  Film(
    this.name,
    this.image,
    this.zhanr,
    this.rating,
    this.description
  );
}
