import 'package:flutter/material.dart';
import 'package:min2_tech_cruncher/screens/home_screen.dart';
import 'package:min2_tech_cruncher/style/style.dart';



void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TECH CRUNCHER',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: RegularFont,
      ),
      home: HomeScreen(),
    );
  }
}
