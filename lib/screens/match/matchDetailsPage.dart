import 'package:dota_stats/apiCalls.dart';
import 'package:dota_stats/models/matchDetails.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:dota_stats/models/matchDetails.dart';
import 'components/teamOverview.dart';
import 'components/teamDetails.dart';
import 'package:dota_stats/styles/fontStyles.dart';

class MatchDetailsPage extends StatefulWidget {
  final int match;
  final Map<String, List<dynamic>> rolesAndGameModes;
  MatchDetailsPage(this.match, this.rolesAndGameModes);

  @override
  _MatchDetailsState createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetailsPage> {
  Future<MatchDetails> matchDetails;

  List<prefix0.Player> getRadiantPlayers(MatchDetails matchDetails) {
    return matchDetails.players
        .where((player) => player.isRadiant == true)
        .toList();
  }

  List<prefix0.Player> getDirePlayers(MatchDetails matchDetails) {
    return matchDetails.players
        .where((player) => player.isRadiant == false)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    matchDetails = fetchMatchDetails(widget.match);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MatchDetails>(
        future: matchDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                appBar: AppBar(
                    title: Text(widget.rolesAndGameModes["gameModes"][snapshot.data.gameMode].name +
                        " @ " +
                        DateTime.fromMillisecondsSinceEpoch(
                                snapshot.data.startDateTime * 1000)
                            .toString()
                            .substring(0, 11) +
                        " | " +
                        (DateTime.fromMillisecondsSinceEpoch(
                                    snapshot.data.startDateTime * 1000)
                                .toString()
                                .substring(11, 16) +
                            "   "),
                    style: FontStyles.appBarMatchDetails()),),
                body: Center(
                    child: Container(
                        color: Theme.of(context).primaryColor,
                        child: Column(children: <Widget>[
                          TeamOverview(snapshot.data),
                          Text("Team Radiant",
                              style: FontStyles.whiteTextHeader()),
                          TeamDetails(getRadiantPlayers(snapshot.data),
                              widget.rolesAndGameModes["roles"]),
                          Text("Team Dire",
                              style: FontStyles.whiteTextHeader()),
                          TeamDetails(getDirePlayers(snapshot.data),
                              widget.rolesAndGameModes["roles"])
                        ]))));
          }
          return Scaffold(
              body: Center(
                  child: Container(
                      child: Container(
                          height: 20.0,
                          width: 20.0,
                          child: CircularProgressIndicator()))));
        });
  }
}
