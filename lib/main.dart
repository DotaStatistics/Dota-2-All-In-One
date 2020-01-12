import 'package:dota_stats/screens/items/items.dart';
import 'package:dota_stats/screens/heroes/heroes.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dota All-In-One',
      theme: ThemeData(
          // primarySwatch: Colors.blueGrey,
          primaryColor: Colors.black,
          primaryTextTheme: TextTheme(
              title:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
              body1: TextStyle(color: Colors.white70))),
      home: Home(),
      routes: {
        Routes.home: (context) => Home(),
        Routes.heroes: (context) => HeroScreen(),
        Routes.items: (context) => ItemScreen(),
      },
    );
  }
}
