import 'package:flutter/material.dart';
import 'package:min2_tech_cruncher/injection/di_providers.dart';
import 'package:min2_tech_cruncher/view/screens/home_screen.dart';
import 'package:min2_tech_cruncher/view/style/style.dart';
import 'package:min2_tech_cruncher/viewmodel/headline_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:min2_tech_cruncher/model/database/database_table.dart';  /// [tegaki]



// MyDatabase myDatabase;
/// [````` For ProxyProvider `````]


void main() {
  // myDatabase = MyDatabase();
  /// [````` For ProxyProvider `````]

  runApp(
    MultiProvider(
      // providers: [
      //   ChangeNotifierProvider<HeadlineViewModel>(
      //     create: (context) => HeadlineViewModel(),
      //   ),
      // ],
      providers: globalProviders,
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
