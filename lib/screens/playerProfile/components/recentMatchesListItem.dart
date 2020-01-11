import 'package:dota_stats/database.dart';
import 'package:dota_stats/screens/generalComponents/purchasedItemsList.dart';
import 'package:flutter/material.dart';
import 'package:dota_stats/models/dotaMatch.dart';
import 'package:dota_stats/styles/fontStyles.dart';
import 'KDA.dart';

class MatchListItem extends StatefulWidget {
  final DotaMatch match;
  final String gameMode;
  final String role;

  MatchListItem(this.match, this.gameMode, this.role);

  @override
  _MatchListItemState createState() => _MatchListItemState();
}

//TODO: implement matchItemInfo as Map

class _MatchListItemState extends State<MatchListItem> {
  DatabaseHelper db = DatabaseHelper.instance;
  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, String>> getMatchItemInfo(DotaMatch match) async {
    Map<String, String> map = Map();
    Future.wait([
      DatabaseHelper.instance.getGameModeName(match.gameMode).then((result) {
        map["gameMode"] = result;
      }),
      DatabaseHelper.instance.getRoleName(match.players[0].role).then((result) {
        map["role"] = result;
      })
    ]);
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Container(
            color: Colors.blueGrey,
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Text(widget.match.players[0].isVictory ? "WIN" : "LOSS",
                    style: widget.match.players[0].isVictory
                        ? FontStyles.win()
                        : FontStyles.loss()),
                Text("  " +
                    DateTime.fromMillisecondsSinceEpoch(
                            widget.match.startDateTime * 1000)
                        .toString()
                        .substring(0, 11) +
                    " | "),
                Text(DateTime.fromMillisecondsSinceEpoch(
                            widget.match.startDateTime * 1000)
                        .toString()
                        .substring(11, 16) +
                    "   "),
                KDA(
                    widget.match.players[0].numKills,
                    widget.match.players[0].numDeaths,
                    widget.match.players[0].numAssists),
                Text(widget.role),
                Text(widget.gameMode)
              ]),
              PurchasedItemsList(widget.match.players[0]),
            ])));
  }
}
