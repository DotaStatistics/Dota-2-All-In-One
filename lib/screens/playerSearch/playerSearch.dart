import 'package:flutter/material.dart';
import 'package:dota_stats/screens/playerSearch/components/playerResults.dart';
import 'package:dota_stats/screens/profile/playerProfile.dart';
import 'package:dota_stats/screens/playerSearch/components/playerListItem.dart';

class PlayerSearchScreen extends StatefulWidget {
  PlayerSearchScreen();
  @override
  _PlayerSearchState createState() => _PlayerSearchState();
}

class _PlayerSearchState extends State<PlayerSearchScreen> {
  Future<PlayerResults> playerResults;
  final TextEditingController controller = TextEditingController();
  bool loading = false;

  showProfilePage(BuildContext context, int steamId) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PlayerDetailPage(steamId.toString());
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget> [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Look up a Player',
            ),
            onSubmitted: (String query) {
              setState(() {
                playerResults = fetchPlayerResults(controller.text);
                loading = true;

              });
              controller.text = '';
            },
          ),
          FutureBuilder<PlayerResults>(
            future: playerResults,
            builder: (context, snapshot) {
              if (loading == false){
                return Container();
              }
              if (snapshot.hasData) {
                return Expanded(
                    child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data.players.length,
                    itemBuilder: (context, int) {
                      return InkWell(
                          onTap: () {
                            showProfilePage(context,
                                snapshot.data.players[int].id);
                          },
                          child: PlayerListItem(
                              snapshot.data.players[int]));
                    }));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          )
        ]
      )
    );
  }

}