class Player {
  int id;
  String profileUri;
  String countryCode;
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

  Player({
    this.id,
    this.profileUri,
    this.countryCode,
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
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        profileUri: json["profileUri"],
        countryCode: json["countryCode"] == null ? null : json["countryCode"],
        communityVisibleState: json["communityVisibleState"] == null
            ? null
            : json["communityVisibleState"],
        name: json["name"],
        lastLogOff: json["lastLogOff"] == null ? null : json["lastLogOff"],
        avatar: json["avatar"],
        primaryClanId: json["primaryClanId"] == null
            ? null
            : json["primaryClanId"].toDouble(),
        soloRank: json["soloRank"] == null ? null : json["soloRank"],
        partyRank: json["partyRank"] == null ? null : json["partyRank"],
        isAnonymous: json["isAnonymous"],
        isStratzAnonymous: json["isStratzAnonymous"],
        seasonRank: json["seasonRank"] == null ? null : json["seasonRank"],
        smurfFlag: json["smurfFlag"] == null ? null : json["smurfFlag"],
        smurfCheckDate:
            json["smurfCheckDate"] == null ? null : json["smurfCheckDate"],
        lastMatchDateTime: json["lastMatchDateTime"] == null
            ? null
            : json["lastMatchDateTime"],
        lastMatchRegionId: json["lastMatchRegionId"] == null
            ? null
            : json["lastMatchRegionId"],
        isDotaPlusSubscriber: json["isDotaPlusSubscriber"] == null
            ? null
            : json["isDotaPlusSubscriber"],
        dotaPlusOriginalStartDate: json["dotaPlusOriginalStartDate"] == null
            ? null
            : json["dotaPlusOriginalStartDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profileUri": profileUri,
        "countryCode": countryCode == null ? null : countryCode,
        "communityVisibleState":
            communityVisibleState == null ? null : communityVisibleState,
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
        "lastMatchDateTime":
            lastMatchDateTime == null ? null : lastMatchDateTime,
        "lastMatchRegionId":
            lastMatchRegionId == null ? null : lastMatchRegionId,
        "isDotaPlusSubscriber":
            isDotaPlusSubscriber == null ? null : isDotaPlusSubscriber,
        "dotaPlusOriginalStartDate": dotaPlusOriginalStartDate == null
            ? null
            : dotaPlusOriginalStartDate,
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
