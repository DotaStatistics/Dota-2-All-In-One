import 'package:dota_stats/models/dotaMatch.dart';
import 'package:dota_stats/screens/playerProfile/components/profilePieChart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:dota_stats/models/playerInfo.dart';
import 'KDA.dart';

class Review extends StatelessWidget{
  final PlayerInfo info;
  Review(this.info);

 int winCount (List<DotaMatch> matches){
    int wins = 0;
    matches.forEach((match) => {
      if (match.players[0].isVictory){
        wins++
      }
    });
    return wins;
  }


  
  int kills (List<DotaMatch> matches){
   return matches.fold(0, (prev, element) => prev + element.players[0].numKills);
  }

  int deaths (List<DotaMatch> matches){
    return matches.fold(0, (prev, element) => prev + element.players[0].numDeaths);
  }

  int assists (List<DotaMatch> matches){
    return matches.fold(0, (prev, element) => prev + element.players[0].numAssists);
  }


  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
          KDA(kills(info.matches), deaths(info.matches), assists(info.matches)),
          ProfilePieChart(info.matches.length, winCount(info.matches))
      ],
    );
  }


}