import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lesson7/Profile.dart';
import 'package:lesson7/api.dart';
import 'package:lesson7/apilist.dart';
import 'package:lesson7/country_screen.dart';
import 'package:lesson7/domashka1.dart';
import 'package:lesson7/gridview.dart';
import 'package:lesson7/login.dart';
import 'package:lesson7/menu.dart';
import 'package:lesson7/news.dart';
import 'package:lesson7/notes.dart';
import 'package:lesson7/profile77.dart';
import 'package:lesson7/recept_screen.dart';
import 'package:lesson7/users.dart';
import 'package:lesson7/weater_screen.dart';
import 'package:lesson7/zametki.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyAF1m41GhQ_6CpxcAhb3vKnfGmLs5olMEM',
    appId: 'com.example.lesson7',
    messagingSenderId: 'sendid',
    projectId: 'smartcastle-4c77d',
    storageBucket: 'smartcastle-4c77d.appspot.com',
  ));

  runApp(const MainApp());
  initializeDateFormatting('ru', null).then((_) {});
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Menu(),
    );
  }
}
