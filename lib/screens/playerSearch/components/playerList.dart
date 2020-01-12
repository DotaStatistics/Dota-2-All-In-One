import 'package:flutter/material.dart';
import 'package:dota_stats/models/player.dart';
import 'playerListItem.dart';
import 'package:dota_stats/screens/playerProfile/playerProfile.dart';

import 'package:dota_stats/database.dart';

class PlayerList extends StatelessWidget {
  final List<Player> players;

  PlayerList(this.players);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            color: Colors.blueGrey,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: players.length,
                itemBuilder: (context, int) {
                  return InkWell(
                      onTap: () {
                        checkPrivacySettings(context, players[int]);
                      },
                      child: PlayerListItem(players[int]));
                })));
  }
}

checkPrivacySettings(BuildContext context, Player player) {
  (player.isAnonymous || player.isStratzAnonymous)
      ? showPopup(context)
      : showProfilePage(context, player.id);
}

showPopup(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.redAccent,
    content: new Text('Player Profile is Private!'),
  ));
}

showProfilePage(BuildContext context, int steamId) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return PlayerProfile(steamId.toString());
  }));
}
