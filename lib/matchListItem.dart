import 'package:flutter/material.dart';
import 'recentMatchesResults.dart';

class MatchListItem extends StatelessWidget{
  final RecentMatchesResults match;
  MatchListItem(this.match);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: <Widget> [
            Text(match.players[0].isVictory ? "WIN" : "LOSE"),
            Text("  " + match.players[0].numKills.toString() + "/" ),
            Text(match.players[0].numDeaths.toString() + "/"),
            Text(match.players[0].numAssists.toString()),
          ]
        )
      )
      //showMatchDetailPage and pass in match.id
    );
  }
}