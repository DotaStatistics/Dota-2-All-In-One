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
        primarySwatch: Colors.blueGrey,
      ),
      home: Home(),
      routes: {
        Routes.home: (context) => Home(),
        Routes.heroes: (context) => HeroScreen(),
        Routes.items: (context) => ItemScreen(),
      },
    );
  }
}


