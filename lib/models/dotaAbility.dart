// To parse this JSON data, do
//
//     final dotaAbility = dotaAbilityFromJson(jsonString);

import 'dart:convert';

Map<String, DotaAbility> dotaAbilityFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, DotaAbility>(k, DotaAbility.fromJson(v)));

String dotaAbilityToJson(Map<String, DotaAbility> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class DotaAbility {
  int id;
  String name;
  bool drawMatchPage;
  bool isTalent;
  Language language;
  Stat stat;
  String uri;

  DotaAbility({
    this.id,
    this.name,
    this.drawMatchPage,
    this.isTalent,
    this.language,
    this.stat,
    this.uri,
  });

  factory DotaAbility.fromJson(Map<String, dynamic> json) => DotaAbility(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    drawMatchPage: json["drawMatchPage"] == null ? null : json["drawMatchPage"],
    isTalent: json["isTalent"] == null ? null : json["isTalent"],
    language: json["language"] == null ? null : Language.fromJson(json["language"]),
    stat: json["stat"] == null ? null : Stat.fromJson(json["stat"]),
    uri: json["uri"] == null ? null : json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "drawMatchPage": drawMatchPage == null ? null : drawMatchPage,
    "isTalent": isTalent == null ? null : isTalent,
    "language": language == null ? null : language.toJson(),
    "stat": stat == null ? null : stat.toJson(),
    "uri": uri == null ? null : uri,
  };
}

class Language {
  int abilityId;
  int gameVersionId;
  int languageId;
  String displayName;
  List<String> description;
  List<String> attributes;
  List<String> notes;
  String lore;
  String aghanimDescription;

  Language({
    this.abilityId,
    this.gameVersionId,
    this.languageId,
    this.displayName,
    this.description,
    this.attributes,
    this.notes,
    this.lore,
    this.aghanimDescription,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    abilityId: json["abilityId"] == null ? null : json["abilityId"],
    gameVersionId: json["gameVersionId"] == null ? null : json["gameVersionId"],
    languageId: json["languageId"] == null ? null : json["languageId"],
    displayName: json["displayName"] == null ? null : json["displayName"],
    description: json["description"] == null ? null : List<String>.from(json["description"].map((x) => x)),
    attributes: json["attributes"] == null ? null : List<String>.from(json["attributes"].map((x) => x)),
    notes: json["notes"] == null ? null : List<String>.from(json["notes"].map((x) => x)),
    lore: json["lore"] == null ? null : json["lore"],
    aghanimDescription: json["aghanimDescription"] == null ? null : json["aghanimDescription"],
  );

  Map<String, dynamic> toJson() => {
    "abilityId": abilityId == null ? null : abilityId,
    "gameVersionId": gameVersionId == null ? null : gameVersionId,
    "languageId": languageId == null ? null : languageId,
    "displayName": displayName == null ? null : displayName,
    "description": description == null ? null : List<dynamic>.from(description.map((x) => x)),
    "attributes": attributes == null ? null : List<dynamic>.from(attributes.map((x) => x)),
    "notes": notes == null ? null : List<dynamic>.from(notes.map((x) => x)),
    "lore": lore == null ? null : lore,
    "aghanimDescription": aghanimDescription == null ? null : aghanimDescription,
  };
}

class Stat {
  int abilityId;
  int gameVersionId;
  int type;
  int behavior;
  int unitTargetType;
  int unitTargetTeam;
  int unitTargetFlags;
  int unitDamageType;
  int spellImmunity;
  double modifierSupportValue;
  int modifierSupportBonus;
  bool isOnCastbar;
  bool isOnLearnbar;
  int fightRecapLevel;
  bool isGrantedByScepter;
  bool hasScepterUpgrade;
  int maxLevel;
  int levelsBetweenUpgrade;
  int requiredLevel;
  bool displayAdditionalHeroes;
  List<int> castRangeBuffer;
  bool isUltimate;
  List<int> castRange;
  List<double> castPoint;
  List<double> cooldown;
  List<int> manaCost;
  List<double> channelTime;
  List<int> damage;
  String hotKeyOverride;

  Stat({
    this.abilityId,
    this.gameVersionId,
    this.type,
    this.behavior,
    this.unitTargetType,
    this.unitTargetTeam,
    this.unitTargetFlags,
    this.unitDamageType,
    this.spellImmunity,
    this.modifierSupportValue,
    this.modifierSupportBonus,
    this.isOnCastbar,
    this.isOnLearnbar,
    this.fightRecapLevel,
    this.isGrantedByScepter,
    this.hasScepterUpgrade,
    this.maxLevel,
    this.levelsBetweenUpgrade,
    this.requiredLevel,
    this.displayAdditionalHeroes,
    this.castRangeBuffer,
    this.isUltimate,
    this.castRange,
    this.castPoint,
    this.cooldown,
    this.manaCost,
    this.channelTime,
    this.damage,
    this.hotKeyOverride,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    abilityId: json["abilityId"] == null ? null : json["abilityId"],
    gameVersionId: json["gameVersionId"] == null ? null : json["gameVersionId"],
    type: json["type"] == null ? null : json["type"],
    behavior: json["behavior"] == null ? null : json["behavior"],
    unitTargetType: json["unitTargetType"] == null ? null : json["unitTargetType"],
    unitTargetTeam: json["unitTargetTeam"] == null ? null : json["unitTargetTeam"],
    unitTargetFlags: json["unitTargetFlags"] == null ? null : json["unitTargetFlags"],
    unitDamageType: json["unitDamageType"] == null ? null : json["unitDamageType"],
    spellImmunity: json["spellImmunity"] == null ? null : json["spellImmunity"],
    modifierSupportValue: json["modifierSupportValue"] == null ? null : json["modifierSupportValue"].toDouble(),
    modifierSupportBonus: json["modifierSupportBonus"] == null ? null : json["modifierSupportBonus"],
    isOnCastbar: json["isOnCastbar"] == null ? null : json["isOnCastbar"],
    isOnLearnbar: json["isOnLearnbar"] == null ? null : json["isOnLearnbar"],
    fightRecapLevel: json["fightRecapLevel"] == null ? null : json["fightRecapLevel"],
    isGrantedByScepter: json["isGrantedByScepter"] == null ? null : json["isGrantedByScepter"],
    hasScepterUpgrade: json["hasScepterUpgrade"] == null ? null : json["hasScepterUpgrade"],
    maxLevel: json["maxLevel"] == null ? null : json["maxLevel"],
    levelsBetweenUpgrade: json["levelsBetweenUpgrade"] == null ? null : json["levelsBetweenUpgrade"],
    requiredLevel: json["requiredLevel"] == null ? null : json["requiredLevel"],
    displayAdditionalHeroes: json["displayAdditionalHeroes"] == null ? null : json["displayAdditionalHeroes"],
    castRangeBuffer: json["castRangeBuffer"] == null ? null : List<int>.from(json["castRangeBuffer"].map((x) => x)),
    isUltimate: json["isUltimate"] == null ? null : json["isUltimate"],
    castRange: json["castRange"] == null ? null : List<int>.from(json["castRange"].map((x) => x)),
    castPoint: json["castPoint"] == null ? null : List<double>.from(json["castPoint"].map((x) => x.toDouble())),
    cooldown: json["cooldown"] == null ? null : List<double>.from(json["cooldown"].map((x) => x.toDouble())),
    manaCost: json["manaCost"] == null ? null : List<int>.from(json["manaCost"].map((x) => x)),
    channelTime: json["channelTime"] == null ? null : List<double>.from(json["channelTime"].map((x) => x.toDouble())),
    damage: json["damage"] == null ? null : List<int>.from(json["damage"].map((x) => x)),
    hotKeyOverride: json["hotKeyOverride"] == null ? null : json["hotKeyOverride"],
  );

  Map<String, dynamic> toJson() => {
    "abilityId": abilityId == null ? null : abilityId,
    "gameVersionId": gameVersionId == null ? null : gameVersionId,
    "type": type == null ? null : type,
    "behavior": behavior == null ? null : behavior,
    "unitTargetType": unitTargetType == null ? null : unitTargetType,
    "unitTargetTeam": unitTargetTeam == null ? null : unitTargetTeam,
    "unitTargetFlags": unitTargetFlags == null ? null : unitTargetFlags,
    "unitDamageType": unitDamageType == null ? null : unitDamageType,
    "spellImmunity": spellImmunity == null ? null : spellImmunity,
    "modifierSupportValue": modifierSupportValue == null ? null : modifierSupportValue,
    "modifierSupportBonus": modifierSupportBonus == null ? null : modifierSupportBonus,
    "isOnCastbar": isOnCastbar == null ? null : isOnCastbar,
    "isOnLearnbar": isOnLearnbar == null ? null : isOnLearnbar,
    "fightRecapLevel": fightRecapLevel == null ? null : fightRecapLevel,
    "isGrantedByScepter": isGrantedByScepter == null ? null : isGrantedByScepter,
    "hasScepterUpgrade": hasScepterUpgrade == null ? null : hasScepterUpgrade,
    "maxLevel": maxLevel == null ? null : maxLevel,
    "levelsBetweenUpgrade": levelsBetweenUpgrade == null ? null : levelsBetweenUpgrade,
    "requiredLevel": requiredLevel == null ? null : requiredLevel,
    "displayAdditionalHeroes": displayAdditionalHeroes == null ? null : displayAdditionalHeroes,
    "castRangeBuffer": castRangeBuffer == null ? null : List<dynamic>.from(castRangeBuffer.map((x) => x)),
    "isUltimate": isUltimate == null ? null : isUltimate,
    "castRange": castRange == null ? null : List<dynamic>.from(castRange.map((x) => x)),
    "castPoint": castPoint == null ? null : List<dynamic>.from(castPoint.map((x) => x)),
    "cooldown": cooldown == null ? null : List<dynamic>.from(cooldown.map((x) => x)),
    "manaCost": manaCost == null ? null : List<dynamic>.from(manaCost.map((x) => x)),
    "channelTime": channelTime == null ? null : List<dynamic>.from(channelTime.map((x) => x)),
    "damage": damage == null ? null : List<dynamic>.from(damage.map((x) => x)),
    "hotKeyOverride": hotKeyOverride == null ? null : hotKeyOverride,
  };
}
