import 'package:flutter/material.dart';
import 'package:dota_stats/screens/playerSearch/playerSearch.dart';
import 'drawer.dart';


class Home extends StatelessWidget {
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    /* Our Scaffold has to be wrapped in a TabController so that this Controller
    can display the Tabs in the AppBar and the different pages in the body
     */
        return Scaffold(
          appBar: AppBar(
            title: Text("home"),
          ),
          drawer: AppDrawer(),
          body: PlayerSearch(),
        );
  }
}