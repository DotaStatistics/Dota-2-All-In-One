import 'package:dota_stats/screens/playerSearch/components/playerList.dart';
import 'package:flutter/material.dart';
import 'package:dota_stats/database.dart';
import 'savedPlayerListItem.dart';

class SavedPlayersList extends StatefulWidget {
  SavedPlayersList();

  @override
  _SavedPlayersState createState() => _SavedPlayersState();
}

class _SavedPlayersState extends State<SavedPlayersList> {
  Future<List<DBPlayer>> players;

  @override
  void initState() {
    super.initState();
    players = DatabaseHelper.instance.savedProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DBPlayer>>(
        future: players,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
                child: Container(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, int) {
                          return InkWell(
                              onTap: () {
                                showProfilePage(context, snapshot.data[int].id);
                              },
                              child: SavedPlayerListItem(snapshot.data[int]));
                        })));
          } else {
            return Container();
          }
        });
  }
}
