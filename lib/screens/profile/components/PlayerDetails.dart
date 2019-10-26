// To parse this JSON data, do
//
//     final playerResults = playerResultsFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<PlayerDetails> fetchPlayerDetails(String steamId) async {
  final response =
  await http.get('https://api.stratz.com/api/v1/Player/' + steamId);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return PlayerDetails.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

PlayerDetails playerDetailsFromJson(String str) => PlayerDetails.fromJson(json.decode(str));

String playerDetailsToJson(PlayerDetails data) => json.encode(data.toJson());

class PlayerDetails {
  SteamAccount steamAccount;
  List<dynamic> battlePass;
  int date;
  List<dynamic> badges;
  int lastRegionId;
  List<Rank> ranks;
  List<dynamic> languageCode;
  int firstMatchDate;
  int matchCount;
  int winCount;
  List<Name> names;

  PlayerDetails({
    this.steamAccount,
    this.battlePass,
    this.date,
    this.badges,
    this.lastRegionId,
    this.ranks,
    this.languageCode,
    this.firstMatchDate,
    this.matchCount,
    this.winCount,
    this.names,
  });

  factory PlayerDetails.fromJson(Map<String, dynamic> json) => PlayerDetails(
    steamAccount: SteamAccount.fromJson(json["steamAccount"]),
    battlePass: List<dynamic>.from(json["battlePass"].map((x) => x)),
    date: json["date"],
    badges: List<dynamic>.from(json["badges"].map((x) => x)),
    lastRegionId: json["lastRegionId"],
    ranks: List<Rank>.from(json["ranks"].map((x) => Rank.fromJson(x))),
    languageCode: List<dynamic>.from(json["languageCode"].map((x) => x)),
    firstMatchDate: json["firstMatchDate"],
    matchCount: json["matchCount"],
    winCount: json["winCount"],
    names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "steamAccount": steamAccount.toJson(),
    "battlePass": List<dynamic>.from(battlePass.map((x) => x)),
    "date": date,
    "badges": List<dynamic>.from(badges.map((x) => x)),
    "lastRegionId": lastRegionId,
    "ranks": List<dynamic>.from(ranks.map((x) => x.toJson())),
    "languageCode": List<dynamic>.from(languageCode.map((x) => x)),
    "firstMatchDate": firstMatchDate,
    "matchCount": matchCount,
    "winCount": winCount,
    "names": List<dynamic>.from(names.map((x) => x.toJson())),
  };
}

class Name {
  String name;
  int lastSeenDateTime;

  Name({
    this.name,
    this.lastSeenDateTime,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    name: json["name"],
    lastSeenDateTime: json["lastSeenDateTime"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lastSeenDateTime": lastSeenDateTime,
  };
}

class Rank {
  int seasonRankId;
  DateTime asOfDateTime;
  int rank;

  Rank({
    this.seasonRankId,
    this.asOfDateTime,
    this.rank,
  });

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
    seasonRankId: json["seasonRankId"],
    asOfDateTime: DateTime.parse(json["asOfDateTime"].toString().substring(0,19)),
    rank: json["rank"],
  );

  Map<String, dynamic> toJson() => {
    "seasonRankId": seasonRankId,
    "asOfDateTime": asOfDateTime.toIso8601String(),
    "rank": rank,
  };
}

class SteamAccount {
  int id;
  String profileUri;
  int timeCreated;
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
  int smurfFlag;
  DateTime smurfCheckDate;

  SteamAccount({
    this.id,
    this.profileUri,
    this.timeCreated,
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
    this.smurfFlag,
    this.smurfCheckDate,
  });

  factory SteamAccount.fromJson(Map<String, dynamic> json) => SteamAccount(
    id: json["id"],
    profileUri: json["profileUri"],
    timeCreated: json["timeCreated"],
    cityId: json["cityId"],
    communityVisibleState: json["communityVisibleState"],
    name: json["name"],
    lastLogOff: json["lastLogOff"],
    avatar: json["avatar"],
    primaryClanId: json["primaryClanId"].toDouble(),
    soloRank: json["soloRank"],
    partyRank: json["partyRank"],
    isAnonymous: json["isAnonymous"],
    isStratzAnonymous: json["isStratzAnonymous"],
    smurfFlag: json["smurfFlag"],
    smurfCheckDate: DateTime.parse(json["smurfCheckDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profileUri": profileUri,
    "timeCreated": timeCreated,
    "cityId": cityId,
    "communityVisibleState": communityVisibleState,
    "name": name,
    "lastLogOff": lastLogOff,
    "avatar": avatar,
    "primaryClanId": primaryClanId,
    "soloRank": soloRank,
    "partyRank": partyRank,
    "isAnonymous": isAnonymous,
    "isStratzAnonymous": isStratzAnonymous,
    "smurfFlag": smurfFlag,
    "smurfCheckDate": smurfCheckDate.toIso8601String(),
  };
}
