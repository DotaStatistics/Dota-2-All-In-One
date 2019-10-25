import 'package:flutter/material.dart';
import 'dart:async';
import 'playerResults.dart';
import 'playerListItem.dart';
import 'playerDetailPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dota Stats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dota Stats'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<PlayerResults> playerResults;
  final TextEditingController controller = TextEditingController();

  showCategoryDetailPage(
      BuildContext context, int SteamId){
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return PlayerDetailPage(SteamId);
  }));

  }

  @override
  void initState() {
    super.initState();
   // playerResults = fetchPlayerResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Pawn a Noob!',
          ),
          onSubmitted: (String query) {
            setState(() {
              playerResults = fetchPlayerResults(controller.text);
            });
            controller.text = '';
          },
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded (
            child:
              FutureBuilder<PlayerResults>(
                future: playerResults,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                      itemCount: snapshot.data.players.length,
                      itemBuilder: (context, int) {
                        return InkWell(
                          onTap: () {
                            loadProfilPage(context, snapshot.data.players[int].steamId);
                          },
                          child: PlayerListItem(snapshot.data.players[int])
                        );
                      }
                    );



                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              )),
            ]),
      ),
    );
  }
}
