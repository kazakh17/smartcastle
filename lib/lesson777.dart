import 'package:flutter/material.dart';
import 'package:lesson7/movie.dart';

class Lesson777 extends StatefulWidget {
  const Lesson777({super.key});

  @override
  State<Lesson777> createState() => _Lesson777State();
}

class _Lesson777State extends State<Lesson777> {
  List<Movie> films = [
    Movie(
        'Флэш',
        'https://e7.pngegg.com/pngimages/1001/868/png-clipart-adobe-flash-flash-superhero-fictional-character-thumbnail.png',
        'Фантастика', 2022),
    Movie(
        'Один дома',
        'https://c0.klipartz.com/pngpicture/362/804/gratis-png-solo-en-casa-2-perdido-en-el-cartel-de-nueva-york-solo-en-casa-solo-en-casa-thumbnail.png',
        'Комедия', 1998),
    Movie(
        'Аватар',
        'https://e7.pngegg.com/pngimages/767/193/png-clipart-avatar-avatar.png',
        'Фантастика',2000),
    Movie(
        'Мадагаскар',
        'https://w7.pngwing.com/pngs/799/805/png-transparent-madagascar-animals-to-pull-material-free-flat-animation-cartoon.png',
        'Мультфильм', 2003),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Список фильмов',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: films.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Container(
                  color: Colors.amber,
                  child: Row(
                    children: [
                      Image.network(
                        films[index].image,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            films[index].name,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            films[index].janr,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            films[index].god.toString(),
                            style: TextStyle(fontSize: 20),
                          ),
                          
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
