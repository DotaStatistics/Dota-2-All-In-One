import 'package:flutter/material.dart';
import 'package:dota_stats/models/playerInfo.dart';
import 'components/basicProfileInfo.dart';
import 'components/recentMatchesList.dart';
import 'package:dota_stats/apiCalls.dart';
import 'package:dota_stats/database.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:dota_stats/models/playerInfo.dart';
import 'components/review.dart';

class PlayerProfile extends StatefulWidget {
  final String steamId;
  PlayerProfile(this.steamId);
  @override
  _PlayerProfileState createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {
  Future<PlayerInfo> playerInfo;
  DatabaseHelper db = DatabaseHelper.instance;
  bool saved = false;

  @override
  void initState() {
    super.initState();
    initSavedStatus();
    playerInfo = fetchPlayerInfo(widget.steamId);

  }

  void initSavedStatus() async {
    bool savedTemp = await db.isSaved(int.parse(widget.steamId));
    setState(() {
      saved = savedTemp;
    });
  }

  void addToSavedProfiles(PlayerInfo playerInfo) {
    db.insertPlayer(DBPlayer.fromAPI(playerInfo));
    setState(() {
      saved = true;
    });
  }

  void deleteFromSavedProfiles(PlayerInfo playerInfo) {
    db.deletePlayer(DBPlayer.fromAPI(playerInfo));
    setState(() {
      saved = false;
    });
  }

  //TODO: Close db when profile is closed
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PlayerInfo>(
        future: playerInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                appBar: AppBar(
                    title: Text(snapshot.data.details.steamAccount.name),
                    actions: <Widget>[
                      IconButton(
                          icon: FlareActor("assets/animations/star.flr",
                              shouldClip: false,
                              animation: saved ? "like" : "unlike"),
                          onPressed: () {
                            saved == true
                                ? deleteFromSavedProfiles(snapshot.data)
                                : addToSavedProfiles(snapshot.data);
                          })
                    ]),
                body: Container(
                  color: Theme.of(context).primaryColor,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      BasicProfileInfo(snapshot.data.details),
                      Review(snapshot.data),
                      RecentMatchesList(snapshot.data.matches),
                    ])));
          } else if (snapshot.hasError) {
            return Scaffold(appBar: AppBar(title: Text("${snapshot.error}")));
          }
          return Scaffold(
              appBar: AppBar(title: Text("Loading Profil Data...")),
              body: Container(
                  color: Theme.of(context).primaryColor,
                child:Center(child: CircularProgressIndicator()))
              );
        });
  }
}
