import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Zametki extends StatefulWidget {
  const Zametki({super.key});

  @override
  State<Zametki> createState() => _ZametkiState();
}

class _ZametkiState extends State<Zametki> {
  TextEditingController textController = TextEditingController();
  List<String> Zametki = [];
  

  @override
  void initState() {
    super.initState();
    getZametkiFromShared();
  }

  Future getZametkiFromShared() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      Zametki = sp.getStringList('zametki_key') ?? [];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Заметки',
          style: TextStyle(fontSize: 26),
        ),
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: SizedBox(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Вы точно хотите удалить запись?'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Нет')),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () async {
                                        SharedPreferences sp =
                                            await SharedPreferences
                                                .getInstance();
                                        setState(() {
                                          Zametki.clear();
                                          sp.remove('zametki_key');
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Text('ДА')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: ListView.separated(
        itemCount: Zametki.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: SizedBox(
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Вы точно хотите удалить запись?'),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Нет')),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () async {
                                        SharedPreferences sp =
                                            await SharedPreferences
                                                .getInstance();
                                        setState(() {
                                          Zametki.removeAt(index);
                                          sp.setStringList(
                                              'zametki_key', Zametki);
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Text('ДА')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  Zametki[index],
                  style: TextStyle(fontSize: 35),
                )),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 2,
          height: 0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            textController.clear();
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.amber,
                    child: SizedBox(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: textController,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                SharedPreferences sp =
                                    await SharedPreferences.getInstance();
                                setState(() {
                                  if (textController.text != '')
                                    Zametki.add(textController.text);
                                  sp.setStringList('zametki_key', Zametki);
                                });

                                Navigator.pop(context);
                              },
                              child: Text('Добавить'),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                  );
                  
                });
                
          },
          backgroundColor: Colors.yellowAccent,
          child: Icon(Icons.add_box)),
          
          
    );
    
    
  }
}

class ShaterPreferences {
  static void getInstance() {}
}
