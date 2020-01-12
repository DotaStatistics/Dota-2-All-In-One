import 'package:dota_stats/apiCalls.dart';
import 'package:dota_stats/models/dotaMatch.dart' as prefix2;
import 'package:dota_stats/models/matchDetails.dart' as prefix0;
import 'package:dota_stats/models/player.dart' as prefix1;
import 'package:dota_stats/models/playerDetails.dart';
import 'package:dota_stats/models/playerInfo.dart';
import 'package:dota_stats/screens/generalComponents/purchasedItemsList.dart';
import 'package:dota_stats/screens/playerProfile/components/KDA.dart';
import 'package:flutter/material.dart';
import 'package:dota_stats/models/matchDetails.dart';
import 'package:dota_stats/models/role.dart';
import 'package:dota_stats/models/player.dart';
import 'package:dota_stats/styles/fontStyles.dart';

class PlayerOverview extends StatefulWidget {
  final prefix0.Player player;
  final List<Role> roles;

  PlayerOverview(this.player, this.roles);

  @override
  _PlayerOverviewState createState() => _PlayerOverviewState();
}

class _PlayerOverviewState extends State<PlayerOverview> {
  Future<String> playerName;

  @override
  void initState() {
    super.initState();
    playerName = fetchPlayerNameFromId(widget.player.steamId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: playerName,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
              child: Container(
                  height: 70.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("Name: " + snapshot.data,
                          style: FontStyles.whiteText()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("   KDA:", style: FontStyles.whiteText()),
                          KDA(widget.player.numKills, widget.player.numDeaths,
                              widget.player.numAssists),
                          Text("  Role: ", style: FontStyles.whiteText()),
                          Text(
                              widget.player.role != null
                                  ? widget.roles[widget.player.role].name
                                  : "No Role",
                              style: FontStyles.whiteText())
                        ],
                      ),
                      PurchasedItemsList(
                          prefix2.Player.fromMatchDetails(widget.player))
                    ],
                  )));
        }
        return Container(
            width: 10.0, height: 10.0, child: CircularProgressIndicator());
      },
    );
  }
}
