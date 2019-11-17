import 'package:dota_stats/screens/heroes/heroes.dart';
import 'package:dota_stats/screens/items/items.dart';
import 'package:flutter/material.dart';
import 'package:dota_stats/screens/playerSearch/playerSearch.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* Our Scaffold has to be wrapped in a TabController so that this Controller
    can display the Tabs in the AppBar and the different pages in the body
     */
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
            PlayerSearch(), // This Widget will be shown by default
            HeroScreen(),
            ItemScreen(),
          ]),
        ));
  }
}
