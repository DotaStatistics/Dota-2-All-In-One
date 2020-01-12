import 'package:flutter/material.dart';
import 'package:dota_stats/styles/fontStyles.dart';

class KDA extends StatelessWidget {
  int kills;
  int deaths;
  int assists;

  KDA(this.kills, this.deaths, this.assists);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(kills.toString(), style: FontStyles.greenText()),
        Text("/", style: FontStyles.whiteText()),
        Text(deaths.toString(), style: FontStyles.redText()),
        Text("/", style: FontStyles.whiteText()),
        Text(assists.toString(), style: FontStyles.yellowText()),
      ],
    );
  }
}
