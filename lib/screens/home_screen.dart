import 'package:flutter/material.dart';
import 'package:min2_tech_cruncher/screens/pages/chat_page.dart';
import 'package:min2_tech_cruncher/screens/pages/headline_page.dart';
import 'package:min2_tech_cruncher/screens/pages/stock_page.dart';
import 'package:min2_tech_cruncher/style/style.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  final _bottomNavigationBarPages = [
    HeadlinePage(),
    StockPage(),
    ChatPage(),
  ];
  // final int _currentIndex = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: Text(
            "TECH CRUNCHER",
            style: TextStyle(fontFamily: BoldFont),
          ),
          centerTitle: true,
          actions: [const Icon(Icons.settings)],
        ),

        body: _bottomNavigationBarPages[_currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: const Icon(Icons.note),
              label: "Tech",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.graphic_eq),
              label: "Stock",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.phone),
              label: "Phone",
            ),
          ],
          backgroundColor: Colors.green[100],
          selectedItemColor: Colors.green[700],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}