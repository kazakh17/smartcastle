// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:lesson7/lesson77.dart';

class Lesson6 extends StatefulWidget {
  const Lesson6({super.key});

  @override
  State<Lesson6> createState() => _Lesson6State();
}

class _Lesson6State extends State<Lesson6> {
  @override
  Widget build(BuildContext context) {
    String a = 'Город';
    String b = 'Шымкент';
    String c = 'Дата';
    String d = '25 декабря,2023';
    String e = 'Жанры';
    String f = 'Все жанры';
    String g = 'Человек-паук: Возвращение домой 2017';
    String h = 'фантастика,боевик,триллер';
    String l = 'USA 2:55';

    return Scaffold(
      backgroundColor: Color.fromARGB(66, 147, 139, 139),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.white,
        ),
        title: Text(
          'Сегодня в кино',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 16, 16, 15),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.white),
                SizedBox(
                  width: 10,
                ),
                Text(
                  a,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(b,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.white10,
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            color: Colors.black,
            child: Row(
              children: [
                Icon(
                  Icons.date_range_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(c,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Spacer(),
                Text(d,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: Colors.white10,
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            color: Colors.black,
            child: Row(
              children: [
                Text(e,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Spacer(),
                Text(f,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Divider(height: 1, color: Colors.white10),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Container(
              color: Colors.black,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://www.mirf.ru/wp-content/uploads/2017/07/Poster-2-e1499074975326.jpg',
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(g,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold)),
                        Text(h,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 159, 151, 151),
                                fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              '8.2',
                              style: TextStyle(
                                  color: Color.fromARGB(
                                    255,
                                    24,
                                    200,
                                    71,
                                  ),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '17 000',
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 160, 154, 154)),
                            ),
                            Spacer(),
                            Text(
                              l,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Divider(height: 1, color: Colors.white10),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              color: Colors.black,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://ticketon.kz/media/upload/45370u56102_taptym-au-seny.jpg',
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>Lesson77() ));

                          },
                          child: Text('Таптым ау сени',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text('Комедия',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 159, 151, 151),
                                fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Text(
                              '7.7',
                              style: TextStyle(
                                  color: Color.fromARGB(
                                    255,
                                    24,
                                    200,
                                    71,
                                  ),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '15 000',
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 160, 154, 154)),
                            ),
                            Spacer(),
                            Text(
                              'Казахстан 2:04',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1, color: Colors.white10),
          
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Lesson77() ));
              
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                color: Colors.black,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://avatars.mds.yandex.net/get-kinopoisk-image/4303601/08468155-8b49-4004-827c-f6abbbb00114/600x900',
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>Lesson77() ));
                              
                            },
                            child: Text('Флеш',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text('Фантастика',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 159, 151, 151),
                                  fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              SizedBox(
                                height: 60,
                              ),
                              Text(
                                '7.7',
                                style: TextStyle(
                                    color: Color.fromARGB(
                                      255,
                                      24,
                                      200,
                                      71,
                                    ),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                '15 000',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 160, 154, 154)),
                              ),
                              Spacer(),
                              Text(
                                'USA 2:04',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 90,
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => Lesson77()));
              },
              child: Text(
                'Далее',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
        ],
      ),
    );
  }
}
