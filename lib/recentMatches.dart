import 'package:flutter/material.dart';
import 'recentMatchesResults.dart';
import 'matchListItem.dart';

class RecentMatches extends StatefulWidget {
  final String steamId;
  RecentMatches(this.steamId);

  @override
  _RecentMatchesState createState() => _RecentMatchesState();
}

class _RecentMatchesState extends State<RecentMatches> {
  Future<List<RecentMatchesResults>> recentMatchesList;

  showMatchDetails(BuildContext context, RecentMatchesResults match) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return null;//MatchDetailPage(matchId.toString());
    }));
  }

  @override
  void initState() {
    super.initState();
    recentMatchesList = fetchRecentMatches(widget.steamId);
  }

  @override
  Widget build (BuildContext context) {
    return FutureBuilder<List<RecentMatchesResults>>(
      future: recentMatchesList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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