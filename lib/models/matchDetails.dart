// To parse this JSON data, do
//
//     final matchDetails = matchDetailsFromJson(jsonString);

import 'dart:convert';

MatchDetails matchDetailsFromJson(String str) => MatchDetails.fromJson(json.decode(str)[0]);

String matchDetailsToJson(List<MatchDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MatchDetails {
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
  int avgImp;
  int parsedDateTime;
  int gameVersionId;
  int regionId;
  int sequenceNum;
  int rank;
  int bracket;
  int endDateTime;
  List<Player> players;

  MatchDetails({
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
    this.avgImp,
    this.parsedDateTime,
    this.gameVersionId,
    this.regionId,
    this.sequenceNum,
    this.rank,
    this.bracket,
    this.endDateTime,
    this.players,
  });

  factory MatchDetails.fromJson(Map<String, dynamic> json) => MatchDetails(
    id: json["id"] == null ? null : json["id"],
    didRadiantWin: json["didRadiantWin"] == null ? null : json["didRadiantWin"],
    durationSeconds: json["durationSeconds"] == null ? null : json["durationSeconds"],
    startDateTime: json["startDateTime"] == null ? null : json["startDateTime"],
    clusterId: json["clusterId"] == null ? null : json["clusterId"],
    firstBloodTime: json["firstBloodTime"] == null ? null : json["firstBloodTime"],
    lobbyType: json["lobbyType"] == null ? null : json["lobbyType"],
    numHumanPlayers: json["numHumanPlayers"] == null ? null : json["numHumanPlayers"],
    gameMode: json["gameMode"] == null ? null : json["gameMode"],
    replaySalt: json["replaySalt"] == null ? null : json["replaySalt"],
    isStats: json["isStats"] == null ? null : json["isStats"],
    avgImp: json["avgImp"] == null ? null : json["avgImp"],
    parsedDateTime: json["parsedDateTime"] == null ? null : json["parsedDateTime"],
    gameVersionId: json["gameVersionId"] == null ? null : json["gameVersionId"],
    regionId: json["regionId"] == null ? null : json["regionId"],
    sequenceNum: json["sequenceNum"] == null ? null : json["sequenceNum"],
    rank: json["rank"] == null ? null : json["rank"],
    bracket: json["bracket"] == null ? null : json["bracket"],
    endDateTime: json["endDateTime"] == null ? null : json["endDateTime"],
    players: json["players"] == null ? null : List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "didRadiantWin": didRadiantWin == null ? null : didRadiantWin,
    "durationSeconds": durationSeconds == null ? null : durationSeconds,
    "startDateTime": startDateTime == null ? null : startDateTime,
    "clusterId": clusterId == null ? null : clusterId,
    "firstBloodTime": firstBloodTime == null ? null : firstBloodTime,
    "lobbyType": lobbyType == null ? null : lobbyType,
    "numHumanPlayers": numHumanPlayers == null ? null : numHumanPlayers,
    "gameMode": gameMode == null ? null : gameMode,
    "replaySalt": replaySalt == null ? null : replaySalt,
    "isStats": isStats == null ? null : isStats,
    "avgImp": avgImp == null ? null : avgImp,
    "parsedDateTime": parsedDateTime == null ? null : parsedDateTime,
    "gameVersionId": gameVersionId == null ? null : gameVersionId,
    "regionId": regionId == null ? null : regionId,
    "sequenceNum": sequenceNum == null ? null : sequenceNum,
    "rank": rank == null ? null : rank,
    "bracket": bracket == null ? null : bracket,
    "endDateTime": endDateTime == null ? null : endDateTime,
    "players": players == null ? null : List<dynamic>.from(players.map((x) => x.toJson())),
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
  int partyId;
  bool isRandom;
  int lane;
  bool intentionalFeeding;
  int role;
  int imp;
  int award;
  int item0Id;
  int item1Id;
  int item2Id;
  int item3Id;
  int item4Id;
  int item5Id;
  List<int> itemList;
  int backpack0Id;
  int backpack1Id;
  int behavior;
  int heroHealing;
  int roamLane;
  bool isVictory;
  int networth;
  int backpack2Id;

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
    this.partyId,
    this.isRandom,
    this.lane,
    this.intentionalFeeding,
    this.role,
    this.imp,
    this.award,
    this.item0Id,
    this.item1Id,
    this.item2Id,
    this.item3Id,
    this.item4Id,
    this.item5Id,
    this.itemList,
    this.backpack0Id,
    this.backpack1Id,
    this.behavior,
    this.heroHealing,
    this.roamLane,
    this.isVictory,
    this.networth,
    this.backpack2Id,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    matchId: json["matchId"] == null ? null : json["matchId"],
    playerSlot: json["playerSlot"] == null ? null : json["playerSlot"],
    heroId: json["heroId"] == null ? null : json["heroId"],
    steamId: json["steamId"] == null ? null : json["steamId"],
    isRadiant: json["isRadiant"] == null ? null : json["isRadiant"],
    numKills: json["numKills"] == null ? null : json["numKills"],
    numDeaths: json["numDeaths"] == null ? null : json["numDeaths"],
    numAssists: json["numAssists"] == null ? null : json["numAssists"],
    leaverStatus: json["leaverStatus"] == null ? null : json["leaverStatus"],
    numLastHits: json["numLastHits"] == null ? null : json["numLastHits"],
    numDenies: json["numDenies"] == null ? null : json["numDenies"],
    goldPerMinute: json["goldPerMinute"] == null ? null : json["goldPerMinute"],
    experiencePerMinute: json["experiencePerMinute"] == null ? null : json["experiencePerMinute"],
    level: json["level"] == null ? null : json["level"],
    gold: json["gold"] == null ? null : json["gold"],
    goldSpent: json["goldSpent"] == null ? null : json["goldSpent"],
    heroDamage: json["heroDamage"] == null ? null : json["heroDamage"],
    towerDamage: json["towerDamage"] == null ? null : json["towerDamage"],
    partyId: json["partyId"] == null ? null : json["partyId"],
    isRandom: json["isRandom"] == null ? null : json["isRandom"],
    lane: json["lane"] == null ? null : json["lane"],
    intentionalFeeding: json["intentionalFeeding"] == null ? null : json["intentionalFeeding"],
    role: json["role"] == null ? null : json["role"],
    imp: json["imp"] == null ? null : json["imp"],
    award: json["award"] == null ? null : json["award"],
    item0Id: json["item0Id"] == null ? null : json["item0Id"],
    item1Id: json["item1Id"] == null ? null : json["item1Id"],
    item2Id: json["item2Id"] == null ? null : json["item2Id"],
    item3Id: json["item3Id"] == null ? null : json["item3Id"],
    item4Id: json["item4Id"] == null ? null : json["item4Id"],
    item5Id: json["item5Id"] == null ? null : json["item5Id"],
    itemList: [json["item0Id"],json["item1Id"],json["item2Id"], json["item3Id"],json["item4Id"], json["item5Id"]],
    backpack0Id: json["backpack0Id"] == null ? null : json["backpack0Id"],
    backpack1Id: json["backpack1Id"] == null ? null : json["backpack1Id"],
    behavior: json["behavior"] == null ? null : json["behavior"],
    heroHealing: json["heroHealing"] == null ? null : json["heroHealing"],
    roamLane: json["roamLane"] == null ? null : json["roamLane"],
    isVictory: json["isVictory"] == null ? null : json["isVictory"],
    networth: json["networth"] == null ? null : json["networth"],
    backpack2Id: json["backpack2Id"] == null ? null : json["backpack2Id"],
  );

  Map<String, dynamic> toJson() => {
    "matchId": matchId == null ? null : matchId,
    "playerSlot": playerSlot == null ? null : playerSlot,
    "heroId": heroId == null ? null : heroId,
    "steamId": steamId == null ? null : steamId,
    "isRadiant": isRadiant == null ? null : isRadiant,
    "numKills": numKills == null ? null : numKills,
    "numDeaths": numDeaths == null ? null : numDeaths,
    "numAssists": numAssists == null ? null : numAssists,
    "leaverStatus": leaverStatus == null ? null : leaverStatus,
    "numLastHits": numLastHits == null ? null : numLastHits,
    "numDenies": numDenies == null ? null : numDenies,
    "goldPerMinute": goldPerMinute == null ? null : goldPerMinute,
    "experiencePerMinute": experiencePerMinute == null ? null : experiencePerMinute,
    "level": level == null ? null : level,
    "gold": gold == null ? null : gold,
    "goldSpent": goldSpent == null ? null : goldSpent,
    "heroDamage": heroDamage == null ? null : heroDamage,
    "towerDamage": towerDamage == null ? null : towerDamage,
    "partyId": partyId == null ? null : partyId,
    "isRandom": isRandom == null ? null : isRandom,
    "lane": lane == null ? null : lane,
    "intentionalFeeding": intentionalFeeding == null ? null : intentionalFeeding,
    "role": role == null ? null : role,
    "imp": imp == null ? null : imp,
    "award": award == null ? null : award,
    "item0Id": item0Id == null ? null : item0Id,
    "item1Id": item1Id == null ? null : item1Id,
    "item2Id": item2Id == null ? null : item2Id,
    "item3Id": item3Id == null ? null : item3Id,
    "item4Id": item4Id == null ? null : item4Id,
    "item5Id": item5Id == null ? null : item5Id,
    "itemList" : [item0Id, item1Id, item2Id, item3Id, item4Id, item5Id],
    "backpack0Id": backpack0Id == null ? null : backpack0Id,
    "backpack1Id": backpack1Id == null ? null : backpack1Id,
    "behavior": behavior == null ? null : behavior,
    "heroHealing": heroHealing == null ? null : heroHealing,
    "roamLane": roamLane == null ? null : roamLane,
    "isVictory": isVictory == null ? null : isVictory,
    "networth": networth == null ? null : networth,
    "backpack2Id": backpack2Id == null ? null : backpack2Id,
  };
}
