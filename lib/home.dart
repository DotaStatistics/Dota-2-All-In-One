import 'package:dota_stats/apiCalls.dart';
import 'package:flutter/material.dart';
import 'package:dota_stats/screens/playerSearch/playerSearch.dart';
import 'drawer.dart';
import 'database.dart';


class Home extends StatelessWidget {
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    //initiateItemList();
        return Scaffold(
          appBar: AppBar(
            title: Text("home"),
          ),
          drawer: AppDrawer(),
          body: PlayerSearch(),
          backgroundColor: Theme.of(context).primaryColor,
        );
  }
}

void initiateItemList(){
  fetchItemList().then((result){
    List<DBItem> itemList = List();
    result.forEach((k,v) => itemList.add(DBItem.fromAPI(v)));
    DatabaseHelper.instance.fillItemTable(itemList);
  });

}