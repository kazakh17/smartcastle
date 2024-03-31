import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson7/recept_details.dart';
import 'package:lesson7/recept_model.dart';

class ReceptScreen extends StatefulWidget {
  const ReceptScreen({super.key});

  @override
  State<ReceptScreen> createState() => _ReceptScreenState();
}

class _ReceptScreenState extends State<ReceptScreen> {
  List<Recipes> recipes = [];

  void initState() {
    super.initState();
    getRecepts();
  }

  Future getRecepts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));

    if (response.statusCode == 200) {
      ReceptModel receptModel = ReceptModel.fromJson(jsonDecode(response.body));

      setState(
        () {
          recipes = receptModel.recipes!;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Рецепты'), backgroundColor: Colors.blue),
      body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReceptDetails(
                                name: recipes[index].name!,
                                image: recipes[index].image!,
                                rating: recipes[index].rating.toString(),
                                cookTime:
                                    recipes[index].cookTimeMinutes.toString(),
                                ingredients: recipes[index].ingredients!,
                                kuhnya: recipes[index].cuisine!,
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(recipes[index].image!),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: Text(
                                recipes[index].rating.toString()!,
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ))
                        ],
                      ),
                      Text(
                        recipes[index].name!,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
