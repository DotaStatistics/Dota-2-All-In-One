import 'dart:convert';
import 'package:http/http.dart' as http;

Future<PlayerResults> fetchPlayerResults(String query) async {
  final response =
  await http.get('https://api.stratz.com/api/v1/search/player?q=' + query);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return PlayerResults.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

PlayerResults playerResultsFromJson(String str) => PlayerResults.fromJson(json.decode(str));

String playerResultsToJson(PlayerResults data) => json.encode(data.toJson());

class PlayerResults {
  List<Player> players;
  List<dynamic> playersInMatch;
  List<dynamic> matches;
  List<dynamic> leagues;
  List<dynamic> teams;
 //List<Player> proPlayers;
  List<dynamic> casters;

  PlayerResults({
    this.players,
    this.playersInMatch,
    this.matches,
    this.leagues,
    this.teams,
    //this.proPlayers,
    this.casters,
  });

  factory PlayerResults.fromJson(Map<String, dynamic> json) => PlayerResults(
    players: List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
    playersInMatch: List<dynamic>.from(json["playersInMatch"].map((x) => x)),
    matches: List<dynamic>.from(json["matches"].map((x) => x)),
    leagues: List<dynamic>.from(json["leagues"].map((x) => x)),
    teams: List<dynamic>.from(json["teams"].map((x) => x)),
    //proPlayers: List<Player>.from(json["proPlayers"].map((x) => Player.fromJson(x))),
    casters: List<dynamic>.from(json["casters"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "players": List<dynamic>.from(players.map((x) => x.toJson())),
    "playersInMatch": List<dynamic>.from(playersInMatch.map((x) => x)),
    "matches": List<dynamic>.from(matches.map((x) => x)),
    "leagues": List<dynamic>.from(leagues.map((x) => x)),
    "teams": List<dynamic>.from(teams.map((x) => x)),
   // "proPlayers": List<dynamic>.from(proPlayers.map((x) => x.toJson())),
    "casters": List<dynamic>.from(casters.map((x) => x)),
  };
}

class Player {
  int steamId;
  String name;
  DateTime lastActiveTime;
  int lastRegionId;
  int seasonRank;
  String avatar;
  int seasonLeaderboardRank;

  Player({
    this.steamId,
    this.name,
    this.lastActiveTime,
    this.lastRegionId,
    this.seasonRank,
    this.avatar,
    this.seasonLeaderboardRank,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    steamId: json["steamId"],
    name: json["name"],
    lastActiveTime: DateTime.parse(json["lastActiveTime"]),
    lastRegionId: json["lastRegionId"] == null ? null : json["lastRegionId"],
    seasonRank: json["seasonRank"] == null ? null : json["seasonRank"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    seasonLeaderboardRank: json["seasonLeaderboardRank"] == null ? null : json["seasonLeaderboardRank"],
  );

  Map<String, dynamic> toJson() => {
    "steamId": steamId,
    "name": name,
    "lastActiveTime": lastActiveTime.toIso8601String(),
    "lastRegionId": lastRegionId == null ? null : lastRegionId,
    "seasonRank": seasonRank == null ? null : seasonRank,
    "avatar": avatar == null ? null : avatar,
    "seasonLeaderboardRank": seasonLeaderboardRank == null ? null : seasonLeaderboardRank,
  };
}
