import "package:flutter/material.dart";
import "dart:async";
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:dota_stats/drawer.dart';
import 'package:dota_stats/screens/heroDetails/heroDetails.dart';

class HeroScreen extends StatefulWidget {
  static const String routeName = '/heroes';

  HeroScreen();

  @override
  HeroState createState() => new HeroState();
}

class HeroState extends State<HeroScreen> {
//  final String url = "https://api.stratz.com/api/v1/Hero";
  Map<String, dynamic> data = new Map();
  Map<String, dynamic> dotaAbilities = new Map();

  @override
  void initState() {
    super.initState();
    this.getJsonData();
    this.getJsonData2();
  }

  Future<dynamic> getJsonData() async {
    var response = await http.get("https://api.stratz.com/api/v1/Hero");

    print(response.body);

    setState(() {
      data = json.decode(response.body);
    });
    return "Success";
  }

  Future<dynamic> getJsonData2() async {
    var response = await http.get("https://api.stratz.com/api/v1/Ability");

    print(response.body);

    setState(() {
      dotaAbilities = json.decode(response.body);
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    String itemKeyAbilities;
    return new Scaffold(
        appBar: AppBar(
          title: Text("List of Heroes"),
        ),
        drawer: AppDrawer(),
        body: new ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            String itemKey = data.keys.elementAt(index);
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HeroDetailsScreen(
                      data, itemKey, dotaAbilities, itemKeyAbilities);
                }));
              },
              child: new Center(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    getCard(itemKey, index),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Card getCard(String itemKey, int index) {
    return Card(
        child: Row(children: <Widget>[
      CircleAvatar(
          backgroundImage: NetworkImage(
              "http://cdn.dota2.com/apps/dota2/images/heroes/" +
                  data[itemKey]["shortName"] +
                  "_full.png")),
      Padding(padding: EdgeInsets.only(left: 16.0)),
      new Text(
        data[itemKey]["displayName"],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    ]));
  }
}
