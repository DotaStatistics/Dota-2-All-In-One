import 'package:flutter/material.dart';
import 'package:dota_stats/PlayerDetails.dart';

class BasicProfileInfo extends StatelessWidget{
  final PlayerDetails playerDetails;
  BasicProfileInfo(this.playerDetails);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ProfilePic(playerDetails.steamAccount.avatar),
        Text("Games: " + playerDetails.matchCount.toString() + "   "),
        Text("Wins: " + playerDetails.winCount.toString())
      ]
    );
  }
}




class ProfilePic extends StatelessWidget {
  final String avatar;
  ProfilePic(this.avatar);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle
        ),
        alignment: Alignment.topLeft,
        child:  Image.network(
            "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/" + avatar
        )
    );
  }
}