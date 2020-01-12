import "package:flutter/material.dart";
import "dart:async";
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:dota_stats/drawer.dart';
import 'package:dota_stats/screens/itemDetails/itemDetails.dart';


class ItemScreen extends StatefulWidget {
  static const String routeName = '/items';
  ItemScreen();
  @override
  ItemState createState() => new ItemState();
}

class ItemState extends State<ItemScreen> {
  final String url = "https://api.stratz.com/api/v1/Item";
  Map<String, dynamic> data = new Map();


  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<dynamic> getJsonData() async {
    var response = await http.get(url);

    print(response.body);

    setState(() {
      data =  json.decode(response.body);
    });
    return "Success";
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("List of Items"),
        ),
        drawer: AppDrawer(),
        body: new ListView.builder(
          itemCount: data.length,
//          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            String itemKey = data.keys.elementAt(index);
//            return new Container(
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    String itemName=data[itemKey]["displayName"].toString();
                    return ItemDetailsScreen(data, itemKey);
                  }));
                  },
              child: new Center(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Card(
                        child: Row(
                            children: <Widget> [
                              CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      data[itemKey]["image"] != null ?
                                      "http://cdn.dota2.com/apps/dota2/images/items/" + data[itemKey]["image"] :
                                      "https://cdn.pixabay.com/photo/2017/03/05/17/02/placeholder-2119099_960_720.jpg"
                                  )
                              ),
                              Padding(padding: EdgeInsets.only(left: 16.0)),
                              new Text( data[itemKey]["displayName"] != null ?
                                  data[itemKey]["displayName"].toString():
                              "Itemname not found"),
                            ]
                        )
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}