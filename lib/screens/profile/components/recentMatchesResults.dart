import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<RecentMatchesResults>> fetchRecentMatches(String query) async {
  final response =
  await http.get('https://api.stratz.com/api/v1/Player/' + query + "/matches");
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return recentMatchesResultsFromJson(response.body);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

List<RecentMatchesResults> recentMatchesResultsFromJson(String str) => List<RecentMatchesResults>.from(json.decode(str).map((x) => RecentMatchesResults.fromJson(x)));

String recentMatchesResultsToJson(List<RecentMatchesResults> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecentMatchesResults {
  int id;
  bool didRadiantWin;
  int durationSeconds;
  int startDateTime;
  int clusterId;
  int firstBloodTime;
  int lobbyType;
  int numHumanPlayers;
  int gameMode;
  int replaySalt;
  bool isStats;
  int parsedDateTime;
  int gameVersionId;
  int regionId;
  int sequenceNum;
  int rank;
  int bracket;
  int endDateTime;
  List<Player> players;
  int avgImp;

  RecentMatchesResults({
    this.id,
    this.didRadiantWin,
    this.durationSeconds,
    this.startDateTime,
    this.clusterId,
    this.firstBloodTime,
    this.lobbyType,
    this.numHumanPlayers,
    this.gameMode,
    this.replaySalt,
    this.isStats,
    this.parsedDateTime,
    this.gameVersionId,
    this.regionId,
    this.sequenceNum,
    this.rank,
    this.bracket,
    this.endDateTime,
    this.players,
    this.avgImp,
  });

  factory RecentMatchesResults.fromJson(Map<String, dynamic> json) => RecentMatchesResults(
    id: json["id"],
    didRadiantWin: json["didRadiantWin"],
    durationSeconds: json["durationSeconds"],
    startDateTime: json["startDateTime"],
    clusterId: json["clusterId"],
    firstBloodTime: json["firstBloodTime"],
    lobbyType: json["lobbyType"],
    numHumanPlayers: json["numHumanPlayers"],
    gameMode: json["gameMode"],
    replaySalt: json["replaySalt"],
    isStats: json["isStats"],
    parsedDateTime: json["parsedDateTime"],
    gameVersionId: json["gameVersionId"],
    regionId: json["regionId"],
    sequenceNum: json["sequenceNum"],
    rank: json["rank"],
    bracket: json["bracket"],
    endDateTime: json["endDateTime"],
    players: List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
    avgImp: json["avgImp"] == null ? null : json["avgImp"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "didRadiantWin": didRadiantWin,
    "durationSeconds": durationSeconds,
    "startDateTime": startDateTime,
    "clusterId": clusterId,
    "firstBloodTime": firstBloodTime,
    "lobbyType": lobbyType,
    "numHumanPlayers": numHumanPlayers,
    "gameMode": gameMode,
    "replaySalt": replaySalt,
    "isStats": isStats,
    "parsedDateTime": parsedDateTime,
    "gameVersionId": gameVersionId,
    "regionId": regionId,
    "sequenceNum": sequenceNum,
    "rank": rank,
    "bracket": bracket,
    "endDateTime": endDateTime,
    "players": List<dynamic>.from(players.map((x) => x.toJson())),
    "avgImp": avgImp == null ? null : avgImp,
  };
}

class Player {
  int matchId;
  int playerSlot;
  int heroId;
  int steamId;
  bool isRadiant;
  int numKills;
  int numDeaths;
  int numAssists;
  int leaverStatus;
  int numLastHits;
  int numDenies;
  int goldPerMinute;
  int experiencePerMinute;
  int level;
  int gold;
  int goldSpent;
  int heroDamage;
  int towerDamage;
  int lane;
  int role;
  int item0Id;
  int item1Id;
  int item2Id;
  int item3Id;
  int item4Id;
  int item5Id;
  int heroHealing;
  bool isVictory;
  bool isRandom;
  bool intentionalFeeding;
  int imp;
  int award;
  int behavior;
  int roamLane;
  int backpack0Id;

  Player({
    this.matchId,
    this.playerSlot,
    this.heroId,
    this.steamId,
    this.isRadiant,
    this.numKills,
    this.numDeaths,
    this.numAssists,
    this.leaverStatus,
    this.numLastHits,
    this.numDenies,
    this.goldPerMinute,
    this.experiencePerMinute,
    this.level,
    this.gold,
    this.goldSpent,
    this.heroDamage,
    this.towerDamage,
    this.lane,
    this.role,
    this.item0Id,
    this.item1Id,
    this.item2Id,
    this.item3Id,
    this.item4Id,
    this.item5Id,
    this.heroHealing,
    this.isVictory,
    this.isRandom,
    this.intentionalFeeding,
    this.imp,
    this.award,
    this.behavior,
    this.roamLane,
    this.backpack0Id,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    matchId: json["matchId"],
    playerSlot: json["playerSlot"],
    heroId: json["heroId"],
    steamId: json["steamId"],
    isRadiant: json["isRadiant"],
    numKills: json["numKills"],
    numDeaths: json["numDeaths"],
    numAssists: json["numAssists"],
    leaverStatus: json["leaverStatus"],
    numLastHits: json["numLastHits"],
    numDenies: json["numDenies"],
    goldPerMinute: json["goldPerMinute"],
    experiencePerMinute: json["experiencePerMinute"],
    level: json["level"],
    gold: json["gold"],
    goldSpent: json["goldSpent"],
    heroDamage: json["heroDamage"],
    towerDamage: json["towerDamage"],
    lane: json["lane"],
    role: json["role"],
    item0Id: json["item0Id"] == null ? null : json["item0Id"],
    item1Id: json["item1Id"] == null ? null : json["item1Id"],
    item2Id: json["item2Id"],
    item3Id: json["item3Id"] == null ? null : json["item3Id"],
    item4Id: json["item4Id"] == null ? null : json["item4Id"],
    item5Id: json["item5Id"],
    heroHealing: json["heroHealing"],
    isVictory: json["isVictory"],
    isRandom: json["isRandom"] == null ? null : json["isRandom"],
    intentionalFeeding: json["intentionalFeeding"] == null ? null : json["intentionalFeeding"],
    imp: json["imp"] == null ? null : json["imp"],
    award: json["award"] == null ? null : json["award"],
    behavior: json["behavior"] == null ? null : json["behavior"],
    roamLane: json["roamLane"] == null ? null : json["roamLane"],
    backpack0Id: json["backpack0Id"] == null ? null : json["backpack0Id"],
  );

  Map<String, dynamic> toJson() => {
    "matchId": matchId,
    "playerSlot": playerSlot,
    "heroId": heroId,
    "steamId": steamId,
    "isRadiant": isRadiant,
    "numKills": numKills,
    "numDeaths": numDeaths,
    "numAssists": numAssists,
    "leaverStatus": leaverStatus,
    "numLastHits": numLastHits,
    "numDenies": numDenies,
    "goldPerMinute": goldPerMinute,
    "experiencePerMinute": experiencePerMinute,
    "level": level,
    "gold": gold,
    "goldSpent": goldSpent,
    "heroDamage": heroDamage,
    "towerDamage": towerDamage,
    "lane": lane,
    "role": role,
    "item0Id": item0Id == null ? null : item0Id,
    "item1Id": item1Id == null ? null : item1Id,
    "item2Id": item2Id,
    "item3Id": item3Id == null ? null : item3Id,
    "item4Id": item4Id == null ? null : item4Id,
    "item5Id": item5Id,
    "heroHealing": heroHealing,
    "isVictory": isVictory,
    "isRandom": isRandom == null ? null : isRandom,
    "intentionalFeeding": intentionalFeeding == null ? null : intentionalFeeding,
    "imp": imp == null ? null : imp,
    "award": award == null ? null : award,
    "behavior": behavior == null ? null : behavior,
    "roamLane": roamLane == null ? null : roamLane,
    "backpack0Id": backpack0Id == null ? null : backpack0Id,
  };
}
