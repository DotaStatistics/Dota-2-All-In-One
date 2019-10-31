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
  List<dynamic> matches;
  List<dynamic> leagues;
  List<dynamic> teams;
  List<dynamic> proPlayers;
  List<dynamic> casters;

  PlayerResults({
    this.players,
    this.matches,
    this.leagues,
    this.teams,
    this.proPlayers,
    this.casters,
  });

  factory PlayerResults.fromJson(Map<String, dynamic> json) => PlayerResults(
    players: List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
    matches: List<dynamic>.from(json["matches"].map((x) => x)),
    leagues: List<dynamic>.from(json["leagues"].map((x) => x)),
    teams: List<dynamic>.from(json["teams"].map((x) => x)),
    proPlayers: List<dynamic>.from(json["proPlayers"].map((x) => x)),
    casters: List<dynamic>.from(json["casters"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "players": List<dynamic>.from(players.map((x) => x.toJson())),
    "matches": List<dynamic>.from(matches.map((x) => x)),
    "leagues": List<dynamic>.from(leagues.map((x) => x)),
    "teams": List<dynamic>.from(teams.map((x) => x)),
    "proPlayers": List<dynamic>.from(proPlayers.map((x) => x)),
    "casters": List<dynamic>.from(casters.map((x) => x)),
  };
}

class Player {
  int id;
  String profileUri;
  int timeCreated;
  String countryCode;
  int cityId;
  int communityVisibleState;
  String name;
  int lastLogOff;
  String avatar;
  double primaryClanId;
  int soloRank;
  int partyRank;
  bool isAnonymous;
  bool isStratzAnonymous;
  int seasonRank;
  int smurfFlag;
  int smurfCheckDate;
  int lastMatchDateTime;
  int lastMatchRegionId;
  bool isDotaPlusSubscriber;
  int dotaPlusOriginalStartDate;
  String realName;
  String stateCode;

  Player({
    this.id,
    this.profileUri,
    this.timeCreated,
    this.countryCode,
    this.cityId,
    this.communityVisibleState,
    this.name,
    this.lastLogOff,
    this.avatar,
    this.primaryClanId,
    this.soloRank,
    this.partyRank,
    this.isAnonymous,
    this.isStratzAnonymous,
    this.seasonRank,
    this.smurfFlag,
    this.smurfCheckDate,
    this.lastMatchDateTime,
    this.lastMatchRegionId,
    this.isDotaPlusSubscriber,
    this.dotaPlusOriginalStartDate,
    this.realName,
    this.stateCode,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    id: json["id"],
    profileUri: json["profileUri"],
    timeCreated: json["timeCreated"] == null ? null : json["timeCreated"],
    countryCode: json["countryCode"] == null ? null : json["countryCode"],
    cityId: json["cityId"] == null ? null : json["cityId"],
    communityVisibleState: json["communityVisibleState"] == null ? null : json["communityVisibleState"],
    name: json["name"],
    lastLogOff: json["lastLogOff"] == null ? null : json["lastLogOff"],
    avatar: json["avatar"],
    primaryClanId: json["primaryClanId"] == null ? null : json["primaryClanId"].toDouble(),
    soloRank: json["soloRank"] == null ? null : json["soloRank"],
    partyRank: json["partyRank"] == null ? null : json["partyRank"],
    isAnonymous: json["isAnonymous"],
    isStratzAnonymous: json["isStratzAnonymous"],
    seasonRank: json["seasonRank"] == null ? null : json["seasonRank"],
    smurfFlag: json["smurfFlag"] == null ? null : json["smurfFlag"],
    smurfCheckDate: json["smurfCheckDate"] == null ? null : json["smurfCheckDate"],
    lastMatchDateTime: json["lastMatchDateTime"] == null ? null : json["lastMatchDateTime"],
    lastMatchRegionId: json["lastMatchRegionId"] == null ? null : json["lastMatchRegionId"],
    isDotaPlusSubscriber: json["isDotaPlusSubscriber"] == null ? null : json["isDotaPlusSubscriber"],
    dotaPlusOriginalStartDate: json["dotaPlusOriginalStartDate"] == null ? null : json["dotaPlusOriginalStartDate"],
    realName: json["realName"] == null ? null : json["realName"],
    stateCode: json["stateCode"] == null ? null : json["stateCode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profileUri": profileUri,
    "timeCreated": timeCreated == null ? null : timeCreated,
    "countryCode": countryCode == null ? null : countryCode,
    "cityId": cityId == null ? null : cityId,
    "communityVisibleState": communityVisibleState == null ? null : communityVisibleState,
    "name": name,
    "lastLogOff": lastLogOff == null ? null : lastLogOff,
    "avatar": avatar,
    "primaryClanId": primaryClanId == null ? null : primaryClanId,
    "soloRank": soloRank == null ? null : soloRank,
    "partyRank": partyRank == null ? null : partyRank,
    "isAnonymous": isAnonymous,
    "isStratzAnonymous": isStratzAnonymous,
    "seasonRank": seasonRank == null ? null : seasonRank,
    "smurfFlag": smurfFlag == null ? null : smurfFlag,
    "smurfCheckDate": smurfCheckDate == null ? null : smurfCheckDate,
    "lastMatchDateTime": lastMatchDateTime == null ? null : lastMatchDateTime,
    "lastMatchRegionId": lastMatchRegionId == null ? null : lastMatchRegionId,
    "isDotaPlusSubscriber": isDotaPlusSubscriber == null ? null : isDotaPlusSubscriber,
    "dotaPlusOriginalStartDate": dotaPlusOriginalStartDate == null ? null : dotaPlusOriginalStartDate,
    "realName": realName == null ? null : realName,
    "stateCode": stateCode == null ? null : stateCode,
  };
}

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
