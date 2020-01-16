import "package:flutter/material.dart";
import 'package:flutter_html/flutter_html.dart';
import "dart:async";
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:auto_size_text/auto_size_text.dart';

import '../../models/dotaAbility.dart';
import '../../models/dotaAbility.dart';
import '../../models/dotaAbility.dart';
import '../../models/dotaAbility.dart';
import '../../models/dotaAbility.dart';
import '../../models/dotaAbility.dart';

class HeroDetailsScreen extends StatefulWidget {
  Map<String, dynamic> data;
  final String itemKey;
  Map<String, dynamic> dotaAbilities;
  final String itemKeyAbilities;

  HeroDetailsScreen(
      this.data, this.itemKey, this.dotaAbilities, this.itemKeyAbilities);

  @override
  HeroDetailsState createState() => HeroDetailsState();
}

class HeroDetailsState extends State<HeroDetailsScreen> {
//  Map<String, dynamic> data;
//  Map<String, DotaAbility> dataAbilities;
//  String itemKey;

//  HeroDetailsState(this.data, this.itemKey);

  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget titleSection = Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: AutoSizeText(
                      widget.data[widget.itemKey]["displayName"].toUpperCase(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                      maxLines: 1,
                    )),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    widget.data[widget.itemKey]["stat"]["attackType"].toString() + " Hero",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(children: [
                  Image.asset(
                    'assets/images/Health_Icon.png',
                    height: 60,
                    width: 60,
                  ),
                  Text(
                    ((widget.data[widget.itemKey]["stat"]["hpRegen"]) * 1000).toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ]),
              ),
              Container(
                child: Column(children: [
                  Image.asset(
                    'assets/images/Mana_Icon.png',
                    height: 60,
                    width: 60,
                  ),
                  Text(
                    ((widget.data[widget.itemKey]["stat"]["hpRegen"]) * 1000).toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ]),
              ),
            ],
          )),
        ],
      ),
    );

    Widget attributeSection = Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildAttributes('assets/images/Strength_Icon.png', "strength"),
          _buildAttributes('assets/images/Agility_Icon.png', 'agility'),
          _buildAttributes(
              'assets/images/Intelligence_Icon.png', 'intelligence'),
        ],
      ),
    );

    Widget statSection = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _buildStats('assets/images/Armor_Icon.png', "startingArmor"),
            _buildStats('assets/images/Damage_Icon.png', "startingArmor"),
            _buildStats('assets/images/Movespeed_Icon.png', "startingArmor"),
          ]),
        ],
      ),
    );

    Widget abilitiesSection = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _buildAbilities(widget.data[widget.itemKey]["abilities"][0]["abilityId"]),
            _buildAbilities(widget.data[widget.itemKey]["abilities"][1]["abilityId"]),
            _buildAbilities(widget.data[widget.itemKey]["abilities"][2]["abilityId"]),
          ]),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: SingleChildScrollView(
        //        //TODO Description==Null behandeln.
        child: Text(
          returnBio(),
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );

    return MaterialApp(
      title: 'ItemDetails',
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            new ClipRRect(
              borderRadius: new BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              child: Image.network(
                "http://cdn.dota2.com/apps/dota2/images/heroes/" +
                    widget.data[widget.itemKey]["shortName"] +
                    "_full.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 16.0)),
            titleSection,
            attributeSection,
            statSection,
            abilitiesSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildAttributes(String path, String attribute) {
    String attrValue = _getAttributeValue(attribute).toString();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          path,
          height: 40,
          width: 40,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 5, top: 5),
          child: Text(
            attrValue,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildStats(String path, String stat) {
    String attrValue = _getStatValue(stat).toString();
    return Column(
//      mainAxisSize: MainAxisSize.min,
//      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          path,
          height: 40,
          width: 40,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10, top: 5),
          child: Text(
            attrValue,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildAbilities(int abilityId) {
    String attrValue = _getSkillName(abilityId).toString();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            returnSkillDisplayName(abilityId),
//            data["1"]["abilities"][2]["abilityId"].toString(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Image.network(
          "http://cdn.dota2.com/apps/dota2/images/abilities/"+returnSkillName(abilityId)+"_hp1.png",
//          "http://cdn.dota2.com/apps/dota2/images/abilities/" +
//              "faceless_void_time_dilation" +
//              "_lg.png",
          height: 40,
          width: 40,
        ),
      ],
    );
  }

  String returnBio() {
    return widget.data[widget.itemKey]["language"]["bio"];
  }

  String returnSkillName(int abilityId) {
    List<dynamic>

    abilityList=widget.dotaAbilities.entries.map((e)=>e.value).toList();
    Map<String, dynamic> test = abilityList.firstWhere((e2)=>e2["id"]==(abilityId));
    return test["name"];
//    for(var entry in dataAbilities.entries) {
//      if(entry.value == ) {
//    print(dataAbilities[abilityId]);
//        return dataAbilities[abilityId];
//
//      }
//    }
  }

  String returnSkillDisplayName(int abilityId) {
    List<dynamic>

    abilityList=widget.dotaAbilities.entries.map((e)=>e.value).toList();
    Map<String, dynamic> test = abilityList.firstWhere((e2)=>e2["id"]==(abilityId));
    return test["language"]["displayName"];
//    for(var entry in dataAbilities.entries) {
//      if(entry.value == ) {
//    print(dataAbilities[abilityId]);
//        return dataAbilities[abilityId];
//
//      }
//    }
  }

  String _getAttributeValue(String attribute) {
//    return data[itemKey]["stat"][attribute+"Base"].toString()+" + "+ data[itemKey]["stat"][attribute+"Gain"].toString() ;
    return (widget.data[widget.itemKey]["stat"][attribute + "Base"] +
            widget.data[widget.itemKey]["stat"][attribute + "Gain"])
        .toString();
  }

  String _getStatValue(String stat) {
    return widget.data[widget.itemKey]["stat"][stat].toString();
  }

  String _getSkillName(int abilityId) {
//    print (dataAbilities["0"]["name"]);
//    return data["1"]["name"];
//    return dataAbilities.keys.elementAt(0);
//    return "10";
  }
}
