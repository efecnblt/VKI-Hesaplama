import 'package:bmi_calculate/constants.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: first_colour,
        )
      ),
      home: MainPage(),
    );
  }
}


