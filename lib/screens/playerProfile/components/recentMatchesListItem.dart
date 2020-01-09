import 'package:dota_stats/screens/playerProfile/components/purchasedItemsList.dart';
import 'package:flutter/material.dart';
import 'package:dota_stats/models/dotaMatch.dart';
import 'package:dota_stats/styles/fontStyles.dart';
import 'KDA.dart';

class MatchListItem extends StatelessWidget{
  final DotaMatch match;
  MatchListItem(this.match);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: <Widget> [
            Text(match.players[0].isVictory ? "WIN" : "LOSS",
            style: match.players[0].isVictory ? FontStyles.win() : FontStyles.loss()),
            //PurchasedItemsList(match.players[0]),
            KDA(match.players[0].numKills, match.players[0].numDeaths,match.players[0].numAssists)
          ]
        )
      );
  }
}