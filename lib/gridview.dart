import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson7/catalog_details.dart';
import 'package:lesson7/grid_model.dart';

class GridView7 extends StatefulWidget {
  const GridView7({super.key});

  @override
  State<GridView7> createState() => _GridView7State();
}

class _GridView7State extends State<GridView7> {
  List<Products>? gridFromServer = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    getProdacts();
  }

  Future getProdacts() async {
    setState(() {
    loading = true;
      
    });
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      GridModel gridModel = GridModel.fromJson(jsonDecode(response.body));

      setState(() {
        gridFromServer = gridModel.products;
        print(gridFromServer);
      });
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Каталог товаров'),
          backgroundColor: const Color.fromARGB(255, 7, 102, 255),
        ),
        body: 

        loading == true ?
        Center(child: CircularProgressIndicator()) :
        
        RefreshIndicator(
          onRefresh: () async {
            getProdacts();
          },
          child: 


          
          
          
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: gridFromServer!.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>
                    CatalogDetails(
                      image: gridFromServer![index].images!.first,
                      title: gridFromServer![index].title!,
                      price: '${gridFromServer![index].price.toString()}₸',
                    )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      
                      border: Border.all(width: 1, color: Colors.blue),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            gridFromServer![index].images!.first,
                            height: 100,
                          ),
                        ),
                        
                        Text(
                          gridFromServer![index].title!,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text('${gridFromServer![index].price.toString()}₸'),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ));
  }
}
