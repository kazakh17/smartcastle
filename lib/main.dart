import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lesson7/Profile.dart';
import 'package:lesson7/api.dart';
import 'package:lesson7/apilist.dart';
import 'package:lesson7/country_screen.dart';
import 'package:lesson7/domashka1.dart';
import 'package:lesson7/gridview.dart';
import 'package:lesson7/login.dart';
import 'package:lesson7/news.dart';
import 'package:lesson7/notes.dart';
import 'package:lesson7/profile77.dart';
import 'package:lesson7/recept_screen.dart';
import 'package:lesson7/weater_screen.dart';
import 'package:lesson7/zametki.dart';

void main() {
  runApp(const MainApp());
  initializeDateFormatting('ru', null).then((_){});
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: CountryScreen(),
    );
  }
}
