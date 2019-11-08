import 'package:flutter/material.dart';
import 'package:dota_stats/models/dotaMatch.dart';
import 'recentMatchesListItem.dart';
import 'package:dota_stats/screens/match/matchDetailsPage.dart';
import 'package:dota_stats/apiCalls.dart';

class RecentMatchesList extends StatefulWidget {
  final String steamId;
  RecentMatchesList(this.steamId);

  @override
  _RecentMatchesListState createState() => _RecentMatchesListState();
}

class _RecentMatchesListState extends State<RecentMatchesList> {
  Future<List<DotaMatch>> recentMatchesList;

  @override
  void initState() {
    super.initState();
    recentMatchesList = fetchRecentMatches(widget.steamId);
  }

  @override
  Widget build (BuildContext context) {
    return FutureBuilder<List<DotaMatch>>(
      future: recentMatchesList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Expanded(
            child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, int){
              return InkWell(
                onTap: () {
                  showMatchDetails(context, snapshot.data[int]);
                },
                child: MatchListItem(snapshot.data[int]),
              );
            },
          ));
        }
        else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      }
    );
  }
}

showMatchDetails(BuildContext context, DotaMatch match) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return MatchDetailsPage(match);//MatchDetailPage(matchId.toString());
  }));
}