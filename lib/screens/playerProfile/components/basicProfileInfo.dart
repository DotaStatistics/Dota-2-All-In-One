import 'package:flutter/material.dart';
import 'package:dota_stats/models/playerDetails.dart';
import 'package:dota_stats/styles/fontStyles.dart';
import 'package:pie_chart/pie_chart.dart';
import 'profilePieChart.dart';

class BasicProfileInfo extends StatelessWidget {
  final PlayerDetails playerDetails;
  BasicProfileInfo(this.playerDetails);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
      ProfilePic(playerDetails.steamAccount.avatar),
      Column(
        children: <Widget>[
          Text("Games",
          style: FontStyles.whiteTextBold()),
          Text(playerDetails.matchCount.toString(),
              style: FontStyles.whiteText()),
        ],
      ),
      Column(
        children: <Widget>[
          Text("Wins",
          style: FontStyles.greenText()),
          Text(playerDetails.winCount.toString(),
          style: FontStyles.whiteText())
        ],
      ),
          Column(
            children: <Widget>[
              Text("Losses",
                  style: FontStyles.redText()),
              Text((playerDetails.matchCount - playerDetails.winCount).toString(),
                  style: FontStyles.whiteText())
            ],
          ),
      Column(
        children: <Widget>[
          Text("Winrate"),
          Text(((playerDetails.winCount / playerDetails.matchCount) * 100)
                  .toString()
                  .substring(0, 2) +
              "%"),
        ],
      ),
    ]);
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
        decoration: BoxDecoration(shape: BoxShape.rectangle),
        alignment: Alignment.topLeft,
        child: Image.network(
            "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/" +
                avatar));
  }
}
