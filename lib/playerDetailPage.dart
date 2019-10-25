import 'package:flutter/material.dart';
import 'package:dota_stats/PlayerDetails.dart';
import 'basicProfileInfo.dart';
import 'recentMatches.dart';

class PlayerDetailPage extends StatefulWidget {
  final String steamId;
  PlayerDetailPage(this.steamId);
  @override
  _PlayerDetailState createState() => _PlayerDetailState();
}

class _PlayerDetailState extends State<PlayerDetailPage> {
  Future<PlayerDetails> playerDetails;

  @override
  void initState() {
    super.initState();
    playerDetails = fetchPlayerDetails(widget.steamId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PlayerDetails>(
        future: playerDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: AppBar(title: Text(snapshot.data.steamAccount.name)),
                body: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          BasicProfileInfo(snapshot.data),
                          RecentMatches(widget.steamId),
                          //MatchHistoryList(snapshot.data)
                        ]));
          } else if (snapshot.hasError) {
            return Scaffold(appBar: AppBar(title: Text("${snapshot.error}")));
          }
          return Scaffold(
              appBar: AppBar(title: Text("Loading Profil Data...")),
              body: Center(child: CircularProgressIndicator()));
        });
  }
}