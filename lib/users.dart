import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lesson7/restaurant_details.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<DocumentSnapshot> restaurants= [];
  TextEditingController nameController = TextEditingController();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future getUsers() async {
    setState(() {
      loading = true;
    });
    try {
      QuerySnapshot collection =
          await FirebaseFirestore.instance.collection('restaurants').get();
      setState(() {
        restaurants = collection.docs;
      });
    } catch (e) {
      print('error getUsers: $e');
    }
    setState(() {
      loading = false;
    });
  }

  // Future createUsers(String name) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc()
  //         .set({'name': name});
  //   } catch (e) {
  //     print('error createUser:$e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      loading == true?
      Center(child: CircularProgressIndicator()):
       RefreshIndicator(
        onRefresh: () async{
          getUsers();
        },
         child: ListView.builder(
            itemCount: restaurants.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RestaurantDetails(
                            name: restaurants[index]['name'], 
                            rating: restaurants[index]['rating'],
                            phone: restaurants[index]['phone'],
                            ),),);
                      
                    },
                    child: Container(
                      color: Colors.orange,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(restaurants[index]['name']),
                          Text(restaurants[index]['rating']),
                        ],
                      ),
                    ),
                  ));
            }),
       ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (() {
      //     showDialog(
      //         context: context,
      //         builder: (context) {
      //           return Dialog(
      //             child: IntrinsicHeight(
      //                 child: Column(
      //               children: [
      //                 TextField(
      //                   controller: nameController,
      //                   decoration: InputDecoration(hintText: 'Напишите имя'),
      //                 ),
      //                 ElevatedButton(
      //                     onPressed: () {
      //                       createUsers(nameController.text);
      //                       getUsers();
      //                       Navigator.pop(context);
      //                     },
      //                     child: Text('Добавить'))
      //               ],
      //             )),
      //           );
      //         });
      //   }),
      // ),
    );
  }
}
