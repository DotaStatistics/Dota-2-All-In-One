
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<PlayerDetailsResults> fetchPlayerDetails(String steamId) async {
  final response =
  await http.get('https://api.stratz.com/api/v1/Player/' + steamId);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return PlayerDetailsResults.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

PlayerDetailsResults playerDetailsResultsFromJson(String str) => PlayerDetailsResults.fromJson(json.decode(str));

String playerDetailsResultsToJson(PlayerDetailsResults data) => json.encode(data.toJson());

class PlayerDetailsResults {
  SteamAccount steamAccount;
  List<BattlePass> battlePass;
  int date;
  List<dynamic> badges;
  int lastRegionId;
  List<Rank> ranks;
  List<String> languageCode;
  int firstMatchDate;
  int matchCount;
  int winCount;
  List<Name> names;
  TeamElement team;
  int behaviorScore;

  PlayerDetailsResults({
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
    this.team,
    this.behaviorScore,
  });

  factory PlayerDetailsResults.fromJson(Map<String, dynamic> json) => PlayerDetailsResults(
    steamAccount: json["steamAccount"] == null ? null : SteamAccount.fromJson(json["steamAccount"]),
    battlePass: json["battlePass"] == null ? null : List<BattlePass>.from(json["battlePass"].map((x) => BattlePass.fromJson(x))),
    date: json["date"] == null ? null : json["date"],
    badges: json["badges"] == null ? null : List<dynamic>.from(json["badges"].map((x) => x)),
    lastRegionId: json["lastRegionId"] == null ? null : json["lastRegionId"],
    ranks: json["ranks"] == null ? null : List<Rank>.from(json["ranks"].map((x) => Rank.fromJson(x))),
    languageCode: json["languageCode"] == null ? null : List<String>.from(json["languageCode"].map((x) => x)),
    firstMatchDate: json["firstMatchDate"] == null ? null : json["firstMatchDate"],
    matchCount: json["matchCount"] == null ? null : json["matchCount"],
    winCount: json["winCount"] == null ? null : json["winCount"],
    names: json["names"] == null ? null : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
    team: json["team"] == null ? null : TeamElement.fromJson(json["team"]),
    behaviorScore: json["behaviorScore"] == null ? null : json["behaviorScore"],
  );

  Map<String, dynamic> toJson() => {
    "steamAccount": steamAccount == null ? null : steamAccount.toJson(),
    "battlePass": battlePass == null ? null : List<dynamic>.from(battlePass.map((x) => x.toJson())),
    "date": date == null ? null : date,
    "badges": badges == null ? null : List<dynamic>.from(badges.map((x) => x)),
    "lastRegionId": lastRegionId == null ? null : lastRegionId,
    "ranks": ranks == null ? null : List<dynamic>.from(ranks.map((x) => x.toJson())),
    "languageCode": languageCode == null ? null : List<dynamic>.from(languageCode.map((x) => x)),
    "firstMatchDate": firstMatchDate == null ? null : firstMatchDate,
    "matchCount": matchCount == null ? null : matchCount,
    "winCount": winCount == null ? null : winCount,
    "names": names == null ? null : List<dynamic>.from(names.map((x) => x.toJson())),
    "team": team == null ? null : team.toJson(),
    "behaviorScore": behaviorScore == null ? null : behaviorScore,
  };
}

class BattlePass {
  int eventId;
  int level;

  BattlePass({
    this.eventId,
    this.level,
  });

  factory BattlePass.fromJson(Map<String, dynamic> json) => BattlePass(
    eventId: json["eventId"] == null ? null : json["eventId"],
    level: json["level"] == null ? null : json["level"],
  );

  Map<String, dynamic> toJson() => {
    "eventId": eventId == null ? null : eventId,
    "level": level == null ? null : level,
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
    name: json["name"] == null ? null : json["name"],
    lastSeenDateTime: json["lastSeenDateTime"] == null ? null : json["lastSeenDateTime"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "lastSeenDateTime": lastSeenDateTime == null ? null : lastSeenDateTime,
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
    seasonRankId: json["seasonRankId"] == null ? null : json["seasonRankId"],
    asOfDateTime: json["asOfDateTime"] == null ? null : DateTime.parse(json["asOfDateTime"].toString().substring(0,19)),
    rank: json["rank"] == null ? null : json["rank"],
  );

  Map<String, dynamic> toJson() => {
    "seasonRankId": seasonRankId == null ? null : seasonRankId,
    "asOfDateTime": asOfDateTime == null ? null : asOfDateTime.toIso8601String(),
    "rank": rank == null ? null : rank,
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
  bool isDotaPlusSubscriber;
  int dotaPlusOriginalStartDate;
  bool isAnonymous;
  bool isStratzAnonymous;
  int seasonRank;
  int smurfFlag;
  int smurfCheckDate;
  int lastMatchDateTime;
  int lastMatchRegionId;
  String countryCode;
  String stateCode;
  String realName;

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
    this.isDotaPlusSubscriber,
    this.dotaPlusOriginalStartDate,
    this.isAnonymous,
    this.isStratzAnonymous,
    this.seasonRank,
    this.smurfFlag,
    this.smurfCheckDate,
    this.lastMatchDateTime,
    this.lastMatchRegionId,
    this.countryCode,
    this.stateCode,
    this.realName,
  });

  factory SteamAccount.fromJson(Map<String, dynamic> json) => SteamAccount(
    id: json["id"] == null ? null : json["id"],
    profileUri: json["profileUri"] == null ? null : json["profileUri"],
    timeCreated: json["timeCreated"] == null ? null : json["timeCreated"],
    cityId: json["cityId"] == null ? null : json["cityId"],
    communityVisibleState: json["communityVisibleState"] == null ? null : json["communityVisibleState"],
    name: json["name"] == null ? null : json["name"],
    lastLogOff: json["lastLogOff"] == null ? null : json["lastLogOff"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    primaryClanId: json["primaryClanId"] == null ? null : json["primaryClanId"].toDouble(),
    soloRank: json["soloRank"] == null ? null : json["soloRank"],
    partyRank: json["partyRank"] == null ? null : json["partyRank"],
    isDotaPlusSubscriber: json["isDotaPlusSubscriber"] == null ? null : json["isDotaPlusSubscriber"],
    dotaPlusOriginalStartDate: json["dotaPlusOriginalStartDate"] == null ? null : json["dotaPlusOriginalStartDate"],
    isAnonymous: json["isAnonymous"] == null ? null : json["isAnonymous"],
    isStratzAnonymous: json["isStratzAnonymous"] == null ? null : json["isStratzAnonymous"],
    seasonRank: json["seasonRank"] == null ? null : json["seasonRank"],
    smurfFlag: json["smurfFlag"] == null ? null : json["smurfFlag"],
    smurfCheckDate: json["smurfCheckDate"] == null ? null : json["smurfCheckDate"],
    lastMatchDateTime: json["lastMatchDateTime"] == null ? null : json["lastMatchDateTime"],
    lastMatchRegionId: json["lastMatchRegionId"] == null ? null : json["lastMatchRegionId"],
    countryCode: json["countryCode"] == null ? null : json["countryCode"],
    stateCode: json["stateCode"] == null ? null : json["stateCode"],
    realName: json["realName"] == null ? null : json["realName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "profileUri": profileUri == null ? null : profileUri,
    "timeCreated": timeCreated == null ? null : timeCreated,
    "cityId": cityId == null ? null : cityId,
    "communityVisibleState": communityVisibleState == null ? null : communityVisibleState,
    "name": name == null ? null : name,
    "lastLogOff": lastLogOff == null ? null : lastLogOff,
    "avatar": avatar == null ? null : avatar,
    "primaryClanId": primaryClanId == null ? null : primaryClanId,
    "soloRank": soloRank == null ? null : soloRank,
    "partyRank": partyRank == null ? null : partyRank,
    "isDotaPlusSubscriber": isDotaPlusSubscriber == null ? null : isDotaPlusSubscriber,
    "dotaPlusOriginalStartDate": dotaPlusOriginalStartDate == null ? null : dotaPlusOriginalStartDate,
    "isAnonymous": isAnonymous == null ? null : isAnonymous,
    "isStratzAnonymous": isStratzAnonymous == null ? null : isStratzAnonymous,
    "seasonRank": seasonRank == null ? null : seasonRank,
    "smurfFlag": smurfFlag == null ? null : smurfFlag,
    "smurfCheckDate": smurfCheckDate == null ? null : smurfCheckDate,
    "lastMatchDateTime": lastMatchDateTime == null ? null : lastMatchDateTime,
    "lastMatchRegionId": lastMatchRegionId == null ? null : lastMatchRegionId,
    "countryCode": countryCode == null ? null : countryCode,
    "stateCode": stateCode == null ? null : stateCode,
    "realName": realName == null ? null : realName,
  };
}

class MemberTeam {
  List<TeamElement> members;
  int id;
  String name;
  int winCount;
  int lossCount;
  int lastMatchDateTime;
  bool isFollowed;
  String countryName;

  MemberTeam({
    this.members,
    this.id,
    this.name,
    this.winCount,
    this.lossCount,
    this.lastMatchDateTime,
    this.isFollowed,
    this.countryName,
  });

  factory MemberTeam.fromJson(Map<String, dynamic> json) => MemberTeam(
    members: json["members"] == null ? null : List<TeamElement>.from(json["members"].map((x) => TeamElement.fromJson(x))),
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    winCount: json["winCount"] == null ? null : json["winCount"],
    lossCount: json["lossCount"] == null ? null : json["lossCount"],
    lastMatchDateTime: json["lastMatchDateTime"] == null ? null : json["lastMatchDateTime"],
    isFollowed: json["isFollowed"] == null ? null : json["isFollowed"],
    countryName: json["countryName"] == null ? null : json["countryName"],
  );

  Map<String, dynamic> toJson() => {
    "members": members == null ? null : List<dynamic>.from(members.map((x) => x.toJson())),
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "winCount": winCount == null ? null : winCount,
    "lossCount": lossCount == null ? null : lossCount,
    "lastMatchDateTime": lastMatchDateTime == null ? null : lastMatchDateTime,
    "isFollowed": isFollowed == null ? null : isFollowed,
    "countryName": countryName == null ? null : countryName,
  };
}

class TeamElement {
  int teamId;
  int firstMatchId;
  DateTime firstMatchDateTime;
  int lastMatchId;
  DateTime lastMatchDateTime;
  MemberTeam team;
  SteamAccount steamAccount;

  TeamElement({
    this.teamId,
    this.firstMatchId,
    this.firstMatchDateTime,
    this.lastMatchId,
    this.lastMatchDateTime,
    this.team,
    this.steamAccount,
  });

  factory TeamElement.fromJson(Map<String, dynamic> json) => TeamElement(
    teamId: json["teamId"] == null ? null : json["teamId"],
    firstMatchId: json["firstMatchId"] == null ? null : json["firstMatchId"],
    firstMatchDateTime: json["firstMatchDateTime"] == null ? null : DateTime.parse(json["firstMatchDateTime"]),
    lastMatchId: json["lastMatchId"] == null ? null : json["lastMatchId"],
    lastMatchDateTime: json["lastMatchDateTime"] == null ? null : DateTime.parse(json["lastMatchDateTime"]),
    team: json["team"] == null ? null : MemberTeam.fromJson(json["team"]),
    steamAccount: json["steamAccount"] == null ? null : SteamAccount.fromJson(json["steamAccount"]),
  );

  Map<String, dynamic> toJson() => {
    "teamId": teamId == null ? null : teamId,
    "firstMatchId": firstMatchId == null ? null : firstMatchId,
    "firstMatchDateTime": firstMatchDateTime == null ? null : firstMatchDateTime.toIso8601String(),
    "lastMatchId": lastMatchId == null ? null : lastMatchId,
    "lastMatchDateTime": lastMatchDateTime == null ? null : lastMatchDateTime.toIso8601String(),
    "team": team == null ? null : team.toJson(),
    "steamAccount": steamAccount == null ? null : steamAccount.toJson(),
  };
}
