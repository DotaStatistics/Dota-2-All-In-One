import 'package:flutter/material.dart';
import 'package:dota_stats/screens/playerSearch/components/playerResults.dart';
import 'package:dota_stats/screens/profile/playerProfile.dart';
import 'dart:async';
import 'package:dota_stats/screens/playerSearch/playerSearch.dart';



class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<PlayerResults> playerResults;

  showProfilePage(BuildContext context, int steamId) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PlayerDetailPage(steamId.toString());
    }));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              tabs: [
                Tab(icon: Text("Players")),
                Tab(icon: Text("Heroes")),
                Tab(icon: Text("Items"))
              ],
            ),
          ),
          body: TabBarView(children: [
            PlayerSearchScreen(),
            Text("Heroes here"),
            Text("Items here"),
          ]),
        ));
  }
}
