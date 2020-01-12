import 'package:dota_stats/screens/playerSearch/components/savedPlayersList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dota_stats/apiCalls.dart';
import 'package:dota_stats/models/playerResults.dart';
import 'package:dota_stats/screens/playerSearch/components/playerList.dart';
import 'package:dota_stats/styles/fontStyles.dart';
import 'components/regionFilterDropdownButton.dart';

class PlayerSearch extends StatefulWidget {
  PlayerSearch();
  @override
  _PlayerSearchState createState() => _PlayerSearchState();
}

class _PlayerSearchState extends State<PlayerSearch> {
  Future<PlayerResults> playerResults;
  final TextEditingController controller = TextEditingController();
  int regionId = 1;

  _updateRegion(int id) {
    setState(() {
      regionId = id;
    });

  }

 // _searchForPlayer(S)

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(children: <Widget>[
      Container(
          height: 30.0,
          margin: const EdgeInsets.only(right: 10, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RegionFilterDropdownButton(_updateRegion),
              Container(
                width: 200.0,
                color: Colors.white70,
                child: TextField(
                  style: FontStyles.searchField(),
                  textAlign: TextAlign.left,
                  controller: controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 10.0, left: 3.0),
                    hintText: 'Look up a Player...',
                  ),
                  onSubmitted: (String s) {
                    setState(() {
                      playerResults =
                          fetchPlayerResults(s, regionId);
                    });
                  },
                ),
              ),
              Container(
                child:IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.white70,
                  onPressed: () {
                    setState(() {
                      playerResults =
                          fetchPlayerResults(controller.text, regionId);
                    });
                  },
              )
              )
            ],
          )),
      FutureBuilder<PlayerResults>(
        future: playerResults,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              children: <Widget>[
                CircularProgressIndicator(),
                Text("Searching in Region No." + regionId.toString(),
                    style: FontStyles.whiteText())
              ],
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data.players.length == 0) {
              return Text("No profiles found. Try again");
            }
            return PlayerList(snapshot.data.players);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return SavedPlayersList();
        },
      )
    ])));
  }
}
