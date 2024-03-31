// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lesson7/news_model.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<Articles>? newsFromServer = [];
  bool newsLoading = false;
  DateTime currenTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future getNews() async {
    newsLoading = true;
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?apiKey=d14db04d12c348a6bac286ea1cd84620&language=ru'));

    if (response.statusCode == 200) {
      NewsModel newsModel = NewsModel.fromJson(jsonDecode(response.body));

      setState(() {
        newsFromServer = newsModel.articles;
      });
      setState(() {
        newsLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NEWS LIST',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 81, 126, 232),
      ),
      body: 
      RefreshIndicator(
        onRefresh: () async {
          setState(() {
            currenTime = DateTime.now();
          });
          getNews();
          
        },
        child: newsLoading == true? Center(child: CircularProgressIndicator()):
        Column(
          children: [
            Text('Дата обновление: ${DateFormat('HH:mm:ss')
            .format(currenTime)}',
            style: TextStyle(fontSize: 16),),
            Expanded(
              child: ListView.separated(
                  itemCount: newsFromServer!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4,right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(newsFromServer![index].title!, style: TextStyle (fontWeight: FontWeight.bold,fontSize:18),),
                          Text(newsFromServer![index].author!),
                          Text(DateFormat('dd MMMM yyyy', 'ru').format(  DateTime.parse(newsFromServer![index].publishedAt!)   )  ),
                        ],
                      ),
                    );
                    
                  },
                  separatorBuilder: (BuildContext context,int  index) {
                  return Divider(
                    thickness: 2,
                    height: 0,
                    );
                  }
                   ),
            ),
          ],
        ),
      ),
    );
  }
}
