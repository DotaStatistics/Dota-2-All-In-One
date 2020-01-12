import "package:flutter/material.dart";
import 'package:flutter_html/flutter_html.dart';
import "dart:async";
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:auto_size_text/auto_size_text.dart';

class HeroDetailsScreen extends StatefulWidget {
  Map<String, dynamic> data;
  final String itemKey;
  Map<String, dynamic> dataAbilities;
  final String itemKeyAbilities;

  HeroDetailsScreen(
      this.data, this.itemKey, this.dataAbilities, this.itemKeyAbilities);

  @override
  HeroDetailsState createState() => HeroDetailsState(data, itemKey);
}

class HeroDetailsState extends State<HeroDetailsScreen> {
  Map<String, dynamic> data;
  Map<String, dynamic> dataAbilities;
  String itemKey;

  HeroDetailsState(this.data, this.itemKey);

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
                      data[itemKey]["displayName"].toUpperCase(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                      maxLines: 1,
                    )),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    data[itemKey]["stat"]["attackType"].toString() + " Hero",
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
                    ((data[itemKey]["stat"]["hpRegen"]) * 1000).toString(),
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
                    ((data[itemKey]["stat"]["hpRegen"]) * 1000).toString(),
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

    Widget spellSection = Container(
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
                    data[itemKey]["shortName"] +
                    "_full.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 16.0)),
            titleSection,
            attributeSection,
            spellSection,
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

  Column _buildSkills(int abilityId) {
    String attrValue = _getSkillName(abilityId).toString();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            attrValue,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Image.network(
//          "http://cdn.dota2.com/apps/dota2/images/abilities/"+returnSkillName(abilityId)+"_lg.png",
          "http://cdn.dota2.com/apps/dota2/images/abilities/" +
              "faceless_void_time_dilation" +
              "_lg.png",
          height: 40,
          width: 40,
        ),
      ],
    );
  }

  String returnBio() {
    return data[itemKey]["language"]["bio"];
  }

  String returnSkillName(int abilityId) {
//    for(var i=0; i<dataAbilities.length; i++) {
//      if(dataAbilities[itemKey]==abilityId) {
    print(dataAbilities[abilityId]);
//        return dataAbilities[abilityId];
//
//      }
//    }
  }

  String _getAttributeValue(String attribute) {
//    return data[itemKey]["stat"][attribute+"Base"].toString()+" + "+ data[itemKey]["stat"][attribute+"Gain"].toString() ;
    return (data[itemKey]["stat"][attribute + "Base"] +
            data[itemKey]["stat"][attribute + "Gain"])
        .toString();
  }

  String _getStatValue(String stat) {
    return data[itemKey]["stat"][stat].toString();
  }

  String _getSkillName(int abilityId) {
//    print (dataAbilities["0"]["name"]);
//    return data["1"]["name"];
//    return dataAbilities.keys.elementAt(0);
//    return "10";
  }
}
