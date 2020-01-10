import 'package:dota_stats/database.dart';
import 'package:dota_stats/screens/generalComponents/purchasedItemsList.dart';
import 'package:flutter/material.dart';
import 'package:dota_stats/models/dotaMatch.dart';
import 'package:dota_stats/styles/fontStyles.dart';
import 'KDA.dart';

class MatchListItem extends StatefulWidget {
  final DotaMatch match;

  MatchListItem(this.match);

  @override
  _MatchListItemState createState() => _MatchListItemState();
}

class _MatchListItemState extends State<MatchListItem>{
 String gameMode;
 String role;
 DatabaseHelper db = DatabaseHelper.instance;

 @override
 void initState() {
   super.initState();
   fetchData();
 }

 fetchData() async {
   await fetchGameMode(widget.match.gameMode);
   fetchRole(widget.match.players[0].role);
 }

  Future<void> fetchGameMode(int mode) async {
    return await db.getGameModeName(mode).then((result){
      setState((){
        gameMode = result;
      });
    });
  }

  Future<void> fetchRole(int roleId) async{
   return await db.getRoleName(roleId).then((result){
     setState((){
       role = result;
     });
   });
  }
  
  @override
  Widget build(BuildContext context){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Container(
            color: Colors.blueGrey,
            child: Column(
              children: <Widget>[
                Row(
                    children: <Widget> [
                      Text(widget.match.players[0].isVictory ? "WIN" : "LOSS",
                          style: widget.match.players[0].isVictory ? FontStyles.win() : FontStyles.loss()),
                      Text("  " + DateTime.fromMillisecondsSinceEpoch(widget.match.startDateTime*1000).toString().substring(0,11) + " | "),
                      Text(DateTime.fromMillisecondsSinceEpoch(widget.match.startDateTime*1000).toString().substring(11,16) + "   "),
                      KDA(widget.match.players[0].numKills, widget.match.players[0].numDeaths,widget.match.players[0].numAssists),
                      gameMode != null ? Text(gameMode) : CircularProgressIndicator(),
                      role !=null ? Text(role) : CircularProgressIndicator(),
              ]
            ),
                PurchasedItemsList(widget.match.players[0]),
          ]
        ))
      );
  }
}