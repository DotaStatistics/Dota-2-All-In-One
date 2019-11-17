import "package:flutter/material.dart";
import "dart:async";
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:dota_stats/drawer.dart';

class ItemScreen extends StatefulWidget {
  static const String routeName = '/items';
  ItemScreen();
  @override
  ItemState createState() => new ItemState();
}

class ItemState extends State<ItemScreen> {
  final String url = "https://api.stratz.com/api/v1/Item";
//  final String url = "https://swapi.co/api/people";
  Map<String, dynamic> data = new Map();
//  List data;


  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<dynamic> getJsonData() async {
//  getJsonData() async {
    var response = await http.get(url);
//    var response = await http.get(
//        Uri.encodeFull(url),
//        headers: {"Accept": "application/json"}
//        );
    print(response.body);

    setState(() {
      data =  json.decode(response.body);
//      var convertDataToJson = json.decode(response.body);
//      data = convertDataToJson["results"];
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
            String key = data.keys.elementAt(index);
            return new Container(
              child: new Center(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    new Card(
                      child: new Container(
                          child: new Text(data[key]["displayName"].toString()),
//                          child: new Text(data[index]["name"]),
                          padding: const EdgeInsets.all(20.0)),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}