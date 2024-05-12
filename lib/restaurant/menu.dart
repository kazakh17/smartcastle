import 'package:flutter/material.dart';
import 'package:lesson7/restaurant/users.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedItem = 0;
  int selectedItemBottom = 0;
  List<Widget> widgets = [
    Users(),
    Text('Архивные'),
    Text('Удаленные'),
  ];

  List<Widget> bottomWidgets = [
    Users(),
    Text('Сообщения'),
    Text('Профиль'),
  ];
  String selected = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Рестораны'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: selected == 'drawer' ?
      Center(child: widgets.elementAt(selectedItem)):
      Center(child: bottomWidgets.elementAt(selectedItemBottom)),
      drawer: Drawer(
        backgroundColor: Colors.white30,
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'Шапка',
                        style: TextStyle(fontSize: 24),
                      ),
                      Icon(Icons.person)
                    ],
                  ),
                )),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Все рестораны'),
              onTap: () {
                setState(() {
                  selectedItem = 0;
                  selected = 'drawer';
                });
                Navigator.pop(context);
              },
            ),
            Divider(thickness: 1, height: 2),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Архивные сообщение'),
              onTap: () {
                setState(() {
                  selectedItem = 1;
                  selected = 'drawer';
                });
                Navigator.pop(context);
              },
            ),
            Divider(thickness: 1, height: 2),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Удаленные сообщение'),
              onTap: () {
                setState(() {
                  selectedItem = 2;
                  selected = 'drawer';
                });
                Navigator.pop(context);
              },
            ),
            Divider(thickness: 1, height: 2),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Сообщения'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
          ],
          currentIndex: selectedItemBottom,
          onTap: (value) {
            setState(() {
              selectedItemBottom = value;
              selected = 'bottom';
            });
          },
    ),);
  }
}
