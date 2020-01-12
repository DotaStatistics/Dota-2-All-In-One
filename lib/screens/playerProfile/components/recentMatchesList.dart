import 'package:dota_stats/screens/playerProfile/components/profilePieChart.dart';
import 'package:flutter/material.dart';
import 'package:dota_stats/models/dotaMatch.dart';
import 'recentMatchesListItem.dart';
import 'package:dota_stats/screens/match/matchDetailsPage.dart';
import 'package:dota_stats/apiCalls.dart';
import 'package:dota_stats/models/role.dart';
import 'package:dota_stats/models/gameModes.dart';

class RecentMatchesList extends StatefulWidget {
  final List<DotaMatch> matches;
  RecentMatchesList(this.matches);

  @override
  _RecentMatchesListState createState() => _RecentMatchesListState();
}

class _RecentMatchesListState extends State<RecentMatchesList> {
  Future<Map<String, List<dynamic>>> rolesAndGameModes;

  @override
  void initState() {
    super.initState();
    rolesAndGameModes = fetchRolesAndGameModes();
  }

  Future<Map<String, List<dynamic>>> fetchRolesAndGameModes() async {
    Map<String, List<dynamic>> map = Map();
    await fetchRoleList().then((result) {
      map["roles"] = result;
    });
    await fetchGameModeList().then((result) {
      map["gameModes"] = result.entries.map((e) => e.value).toList();
    });
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, List<dynamic>>>(
        future: rolesAndGameModes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.matches.length,
                  itemBuilder: (context, int) {
                    return InkWell(
                      onTap: () {
                        showMatchDetails(context, widget.matches[int].id, snapshot.data);
                      },
                      child: MatchListItem(
                          widget.matches[int],
                          widget.matches[int].players[0].role != null ?
                          snapshot
                              .data["roles"][widget.matches[int].players[0].role]
                              .name
                          : "No Role",
                          snapshot.data["gameModes"][widget.matches[int].gameMode]
                              .name),
                    );
                  },
                ));
          }
          return CircularProgressIndicator();
        });
  }
}

showMatchDetails(BuildContext context, int match, Map<String, List<dynamic>> rolesAndGameModes) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return MatchDetailsPage(match, rolesAndGameModes); //MatchDetailPage(matchId.toString());
  }));
}

/*
Database-Methods to get Roles and GameModes - currently not functional

Future<Map<String,List<String>>> getRolesAndMatchType(List<DotaMatch> matches) async{
  Map<String,List<String>> map = Map();
  await getRoles(matches).then((result){
    map["roles"] = result;
  });
  await getGameModes(matches).then((result){
    map["gameModes"] = result;
  });
  return map;
}

Future<List<String>> getRoles(List<DotaMatch> matches) async{
  return Future.wait(matches.map((match){
    return DatabaseHelper.instance.getRoleName(match.players[0].role);
  }));
}

Future<List<String>> getGameModes(List<DotaMatch> matches){
  return Future.wait(matches.map((match){
    return DatabaseHelper.instance.getGameModeName(match.gameMode);
  }));
}

*/
