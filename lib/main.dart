import 'package:flutter/material.dart';
import 'package:min2_tech_cruncher/view/screens/home_screen.dart';
import 'package:min2_tech_cruncher/view/style/style.dart';
import 'package:min2_tech_cruncher/viewmodel/headline_viewmodel.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    ChangeNotifierProvider<HeadlineViewModel>(
      create: (context) => HeadlineViewModel(),
      child: MyApp(),
    ),
  );
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
