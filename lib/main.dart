import 'package:flutter/material.dart';
import 'screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dota Stats',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Home(title: 'Dota Stats'),
    );
  }
}


