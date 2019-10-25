import 'package:flutter/material.dart';
import 'playerResults.dart';

class PlayerListItem extends StatelessWidget {
  final Player player;
  PlayerListItem(this.player);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 7.0,
        child: Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(6.0),
            child: Row(
                children: <Widget> [
                  CircleAvatar(
                      backgroundImage: NetworkImage(
                           "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/" + player.avatar
                      )
                  ),
                  Padding(padding: EdgeInsets.only(left: 16.0)),
                  Text(player.name, style: TextStyle(fontSize: 20.0),)
                ]
            )
        )
    );
  }
}