import 'package:flutter/material.dart';
import 'package:dota_stats/models/matchDetails.dart';
import 'package:dota_stats/styles/fontStyles.dart';

class TeamOverview extends StatelessWidget {
  final MatchDetails matchDetails;

  TeamOverview(this.matchDetails);

  int radiantKills(List<Player> players) {
    return players
        .where((player) => player.isRadiant == true)
        .fold(0, (prev, element) => prev + element.numKills);
  }

  int radiantDeaths(List<Player> players) {
    return players
        .where((player) => player.isRadiant == true)
        .fold(0, (prev, element) => prev + element.numDeaths);
  }

  int radiantAssists(List<Player> players) {
    return players
        .where((player) => player.isRadiant == true)
        .fold(0, (prev, element) => prev + element.numAssists);
  }

  int direKills(List<Player> players) {
    return players
        .where((player) => player.isRadiant == false)
        .fold(0, (prev, element) => prev + element.numKills);
  }

  int direDeaths(List<Player> players) {
    return players
        .where((player) => player.isRadiant == false)
        .fold(0, (prev, element) => prev + element.numAssists);
  }

  int direAssists(List<Player> players) {
    return players
        .where((player) => player.isRadiant == false)
        .fold(0, (prev, element) => prev + element.numAssists);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("Radiant KDA", style: FontStyles.whiteText()),
              Row(
                children: <Widget>[
                  Text(radiantKills(matchDetails.players).toString(),
                      style: FontStyles.greenText()),
                  Text("/", style: FontStyles.whiteText()),
                  Text(radiantDeaths(matchDetails.players).toString(),
                      style: FontStyles.redText()),
                  Text("/" + radiantAssists(matchDetails.players).toString(),
                      style: FontStyles.whiteText()),
                ],
              )
            ],
          ),
          Column(children: <Widget>[
            Text("Dire KDA", style: FontStyles.whiteText()),
            Row(
              children: <Widget>[
                Text(direKills(matchDetails.players).toString(),
                    style: FontStyles.greenText()),
                Text("/", style: FontStyles.whiteText()),
                Text(direDeaths(matchDetails.players).toString(),
                    style: FontStyles.redText()),
                Text("/" + direAssists(matchDetails.players).toString(),
                    style: FontStyles.whiteText()),
              ],
            )
          ]),
        ]);
  }
}
