import 'package:dota_stats/apiCalls.dart';
import 'package:dota_stats/models/heroesAndAbilities.dart';
import "package:flutter/material.dart";
import "dart:async";
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:dota_stats/drawer.dart';
import 'package:dota_stats/screens/heroDetails/heroDetails.dart';
import 'package:dota_stats/models/dotaHero.dart';
import 'package:dota_stats/models/dotaAbility.dart';


class HeroScreen extends StatefulWidget {
  static const String routeName = '/heroes';
  HeroScreen();
  @override
  HeroState createState() => new HeroState();
}

class HeroState extends State<HeroScreen> {
  HeroesAndAbilities data;

  @override
  void initState() {
    super.initState();
    fetchHeroesAndAbilities().then((result){
      setState(() {
        data = result;
      });
    });
  }

  List<DotaAbility> getAbilities (int abilityId, List<DotaAbility> abilities){
    return abilities.where((ability) => ability.id == abilityId).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("List of Heroes"),
        ),
        drawer: AppDrawer(),
        body: new ListView.builder(
          itemCount: data.heroes.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HeroDetailsScreen(data.heroes[index], getAbilities(data.heroes[index].id, data.abilities));
                }));
              },
              child: new Center(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    getCard(index),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Card getCard(int index){
    return Card(
        child: Row(
            children: <Widget> [
              CircleAvatar(
                  backgroundImage: NetworkImage(
                      "http://cdn.dota2.com/apps/dota2/images/heroes/" + data.heroes[index].shortName +"_full.png"
                  )
              ),
              Padding(padding: EdgeInsets.only(left: 16.0)),
              new Text(data.heroes[index].shortName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ]
        )
    );
  }
}
