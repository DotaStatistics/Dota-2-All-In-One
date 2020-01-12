import "package:flutter/material.dart";
import 'package:flutter_html/flutter_html.dart';


class ItemDetailsScreen extends StatefulWidget {
  Map<String, dynamic> data;
  final String itemKey;

  ItemDetailsScreen(this.data, this.itemKey);
  @override
  ItemDetailsState createState() => ItemDetailsState(data, itemKey);
}

class ItemDetailsState extends State<ItemDetailsScreen> {
  Map<String, dynamic> data;
  String itemKey;
  ItemDetailsState(this.data, this.itemKey);

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
                    data[itemKey]["language"]["displayName"].toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Text(
                  data[itemKey]["language"]["lore"].length != 0 ?
                  data[itemKey]["language"]["lore"][0]:
                  "",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(30,0,0,0),
              child:
              Image.asset(
            'assets/images/coin_Icon.png',
            height: 40,
            width: 40,
          ),),
          Container(
              padding: EdgeInsets.fromLTRB(5,0,0,0),
              child:
              Text(data[itemKey]["stat"]["cost"].toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                  ))),
        ],
      ),
    );


    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn('assets/images/Strength_Icon.png', "Strength"),
          _buildButtonColumn('assets/images/Agility_Icon.png', 'Agility'),
          _buildButtonColumn('assets/images/Intelligence_Icon.png', 'Intelligence'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.fromLTRB(15,20,0,20),
      child: SingleChildScrollView(
        //        //TODO Description==Null behandeln.
        child: Html(
          data: checkDescription(),
//          data: data[itemKey]["name"],
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
                  data[itemKey]["image"] != null ?
                  "http://cdn.dota2.com/apps/dota2/images/items/" + data[itemKey]["image"] :
                  "https://gamepedia.cursecdn.com/dota2_gamepedia/7/73/Default_recipe_icon.png",
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
        Image.asset(
          path,
          height: 40,
          width: 40,
        ),
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
      ],
    );
  }

  String checkDescription(){
    if(data[itemKey]["language"]["description"].length==0){
      return "";
    }else{
      return data[itemKey]["language"]["description"][0];

    }

  }

  String _getAttributeValue(String attribute) {
    if(data[itemKey]["language"]["attributes"].length!=0){
    for (var i = 0; i < data[itemKey]["language"]["attributes"].length; i++) {
      if (data[itemKey]["language"]["attributes"][i].contains(attribute)) {
        return (data[itemKey]["language"]["attributes"][i].split(" ")[0]);
      } else return "0";
    }
  } else return "0";
  }
}



