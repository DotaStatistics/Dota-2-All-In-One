import 'player.dart';
import 'dart:convert';

class PlayerResults {
  List<Player> players;
  List<dynamic> proPlayers;

  PlayerResults({
    this.players,
    this.proPlayers,
  });

  factory PlayerResults.fromJson(Map<String, dynamic> json) => PlayerResults(
        players:
            List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
        proPlayers: List<dynamic>.from(json["proPlayers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "players": List<dynamic>.from(players.map((x) => x.toJson())),
        "proPlayers": List<dynamic>.from(proPlayers.map((x) => x)),
      };
}

PlayerResults playerResultsFromJson(String str) =>
    PlayerResults.fromJson(json.decode(str));

String playerResultsToJson(PlayerResults data) => json.encode(data.toJson());

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
