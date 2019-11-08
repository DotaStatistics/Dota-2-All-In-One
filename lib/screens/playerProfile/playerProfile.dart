import 'package:flutter/material.dart';
import 'package:dota_stats/models/playerDetails.dart';
import 'components/basicProfileInfo.dart';
import 'components/recentMatchesList.dart';
import 'package:dota_stats/apiCalls.dart';

class PlayerProfile extends StatefulWidget {
  final String steamId;
  PlayerProfile(this.steamId);
  @override
  _PlayerProfileState createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {
  Future<PlayerDetailsResults> playerDetails;

  @override
  void initState() {
    super.initState();
    playerDetails = fetchPlayerDetails(widget.steamId);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PlayerDetailsResults>(
        future: playerDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                appBar: AppBar(title: Text(snapshot.data.steamAccount.name)),
                body: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          BasicProfileInfo(snapshot.data),
                          RecentMatchesList(widget.steamId),
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