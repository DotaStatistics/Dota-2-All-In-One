import 'package:flutter/material.dart';
import 'package:dota_stats/models/matchDetails.dart';
import 'playerOverview.dart';
import 'package:dota_stats/models/role.dart';

class TeamDetails extends StatelessWidget {
  final List<Player> players;
  final List<Role> roles;

  TeamDetails(this.players, this.roles);

  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: players.length,
            itemBuilder: (context, int) {
              return PlayerOverview(players[int], roles);
            }));
  }
}
