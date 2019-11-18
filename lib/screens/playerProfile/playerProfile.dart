import 'package:flutter/material.dart';
import 'package:dota_stats/models/playerDetails.dart';
import 'components/basicProfileInfo.dart';
import 'components/recentMatchesList.dart';
import 'package:dota_stats/apiCalls.dart';

import 'package:dota_stats/database.dart';
import 'package:sqflite/sqflite.dart';

class PlayerProfile extends StatefulWidget {
  final String steamId;
  PlayerProfile(this.steamId);
  @override
  _PlayerProfileState createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {
  Future<PlayerDetails> playerDetails;
  DatabaseHelper db = DatabaseHelper.instance;
  bool saved;

  @override
  void initState() {
    super.initState();
    playerDetails = fetchPlayerDetails(widget.steamId);
    initSavedStatus();
  }

  void initSavedStatus() async {
    bool savedPre = await db.isSaved(int.parse(widget.steamId));
      setState(() {
        saved = savedPre;
      });
  }


  void addToSavedProfiles(PlayerDetails playerDetails) {
   db.insertPlayer(DBPlayer.fromAPI(playerDetails));
    setState(() {
      saved = true;
    });

  }

  void deleteFromSavedProfiles(PlayerDetails playerDetails) {
    db.deletePlayer(DBPlayer.fromAPI(playerDetails));
    setState(() {
      saved = false;
    });
  }





  //TODO: Close db when profile is closed

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PlayerDetails>(
        future: playerDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                appBar: AppBar(
                    title: Text(snapshot.data.steamAccount.name),
                    actions: <Widget>[
                      IconButton(
                          icon: saved == true
                              ? Icon(Icons.star)
                              : Icon(Icons.star_border),
                          onPressed: () {
                            saved == false
                            ? addToSavedProfiles(snapshot.data)
                            : deleteFromSavedProfiles(snapshot.data);
                          })
                    ]),
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      BasicProfileInfo(snapshot.data),
                      RecentMatchesList(widget.steamId),
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
