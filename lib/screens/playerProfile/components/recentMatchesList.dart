import 'package:dota_stats/screens/playerProfile/components/profilePieChart.dart';
import 'package:flutter/material.dart';
import 'package:dota_stats/models/dotaMatch.dart';
import 'recentMatchesListItem.dart';
import 'package:dota_stats/screens/match/matchDetailsPage.dart';
import 'package:dota_stats/apiCalls.dart';


// TODO: scrollable?

class RecentMatchesList extends StatefulWidget {
  final List<DotaMatch> matches;
  RecentMatchesList(this.matches);

  @override
  _RecentMatchesListState createState() => _RecentMatchesListState();
}

class _RecentMatchesListState extends State<RecentMatchesList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build (BuildContext context) {
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.matches.length,
              itemBuilder: (context, int){
                return InkWell(
                  onTap: () {
                    showMatchDetails(context, widget.matches[int]);
                  },
                  child: MatchListItem(widget.matches[int]),
                );
              },
            )
          );
        }
}

showMatchDetails(BuildContext context, DotaMatch match) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return MatchDetailsPage(match);//MatchDetailPage(matchId.toString());
  }));
}