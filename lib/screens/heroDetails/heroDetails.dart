import 'package:dota_stats/models/dotaAbility.dart';
import "package:flutter/material.dart";
import 'package:flutter_html/flutter_html.dart';
import 'package:dota_stats/models/dotaHero.dart';


class HeroDetailsScreen extends StatefulWidget {
  final DotaHero hero;
  final List<DotaAbility> abilities;

  HeroDetailsScreen(this.hero, this.abilities);
  @override
  HeroDetailsState createState() => HeroDetailsState();
}

class HeroDetailsState extends State<HeroDetailsScreen> {
  @override
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
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.hero.displayName.toUpperCase(),
//                    data[itemKey]["language"]["displayName"].toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Text(
                  widget.hero.stat.attackType.toString()+" Hero",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
//          Image.asset(
//            'assets/images/coin_Icon.png',
//            height: 40,
//            width: 40,
//          ),
//          Container(
//              padding: EdgeInsets.fromLTRB(5,0,0,0),
//              child:
//              Text(
//                "cost",
////                  data[itemKey]["stat"]["cost"].toString(),
//                  textAlign: TextAlign.right,
//                  style: TextStyle(
//                    fontSize: 25,
//                    fontWeight: FontWeight.w500,
//                  ))),
        ],
      ),
    );


    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn('assets/images/Strength_Icon.png', "strength"),
          _buildButtonColumn('assets/images/Agility_Icon.png', 'agility'),
          _buildButtonColumn('assets/images/Intelligence_Icon.png', 'intelligence'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.fromLTRB(15,20,15,20),
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
              borderRadius: new BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
              child: Image.network(
                  "http://cdn.dota2.com/apps/dota2/images/heroes/" + widget.hero.shortName +"_full.png",
//                  data[itemKey]["image"] != null ?
//                  "http://cdn.dota2.com/apps/dota2/images/items/" + data[itemKey]["image"] :
//                  "https://gamepedia.cursecdn.com/dota2_gamepedia/7/73/Default_recipe_icon.png",
                  fit: BoxFit.cover
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 16.0)),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(String path, String attribute) {
    String attrValue=_getAttributeValue(attribute).toString();
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
        Image.asset(
          path,
          height: 40,
          width: 40,
        ),

      ],
    );
  }

  String returnBio(){
      return widget.hero.language.bio;
  }

  String _getAttributeValue(String attribute) {
    return data[itemKey]["stat"][attribute+"Base"].toString()+" + "+ data[itemKey]["stat"][attribute+"Gain"].toString() ;
//  return "10";

  }
}



