import 'package:flutter/material.dart';
import 'package:dota_stats/database.dart';

class SavedPlayerListItem extends StatefulWidget {
  final DBPlayer player;
  SavedPlayerListItem(this.player);

  _SavedPlayerListItemState createState() => _SavedPlayerListItemState();
}

class _SavedPlayerListItemState extends State<SavedPlayerListItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
            elevation: 7.0,
            color: Color.fromRGBO(20, 41, 54, 0.7),
            child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(6.0),
                child: Row(children: <Widget>[
                  CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/" +
                              widget.player.avatar)),
                  Padding(padding: EdgeInsets.only(left: 16.0)),
                  Text(
                    widget.player.name,
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  )
                ]))));
  }
}
