

//     final gameMode = gameModeFromJson(jsonString);

import 'dart:convert';

Map<String, GameMode> gameModeFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, GameMode>(k, GameMode.fromJson(v)));

String gameModeToJson(Map<String, GameMode> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class GameMode {
  int id;
  String name;
  String langKey;

  GameMode({
    this.id,
    this.name,
    this.langKey,
  });

  factory GameMode.fromJson(Map<String, dynamic> json) => GameMode(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    langKey: json["langKey"] == null ? null : json["langKey"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "langKey": langKey == null ? null : langKey,
  };

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'langKey': langKey,
    };
  }
}
