// To parse this JSON data, do
//
//     final dotaHero = dotaHeroFromJson(jsonString);

import 'dart:convert';

Map<String, DotaHero> dotaHeroFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, DotaHero>(k, DotaHero.fromJson(v)));

String dotaHeroToJson(Map<String, DotaHero> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class DotaHero {
  int id;
  String name;
  String displayName;
  String shortName;
  List<Ability> abilities;
  List<Role> roles;
  List<Talent> talents;
  Stat stat;
  Language language;
  List<String> aliases;

  DotaHero({
    this.id,
    this.name,
    this.displayName,
    this.shortName,
    this.abilities,
    this.roles,
    this.talents,
    this.stat,
    this.language,
    this.aliases,
  });

  factory DotaHero.fromJson(Map<String, dynamic> json) => DotaHero(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        displayName: json["displayName"] == null ? null : json["displayName"],
        shortName: json["shortName"] == null ? null : json["shortName"],
        abilities: json["abilities"] == null
            ? null
            : List<Ability>.from(
                json["abilities"].map((x) => Ability.fromJson(x))),
        roles: json["roles"] == null
            ? null
            : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        talents: json["talents"] == null
            ? null
            : List<Talent>.from(json["talents"].map((x) => Talent.fromJson(x))),
        stat: json["stat"] == null ? null : Stat.fromJson(json["stat"]),
        language: json["language"] == null
            ? null
            : Language.fromJson(json["language"]),
        aliases: json["aliases"] == null
            ? null
            : List<String>.from(json["aliases"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "displayName": displayName == null ? null : displayName,
        "shortName": shortName == null ? null : shortName,
        "abilities": abilities == null
            ? null
            : List<dynamic>.from(abilities.map((x) => x.toJson())),
        "roles": roles == null
            ? null
            : List<dynamic>.from(roles.map((x) => x.toJson())),
        "talents": talents == null
            ? null
            : List<dynamic>.from(talents.map((x) => x.toJson())),
        "stat": stat == null ? null : stat.toJson(),
        "language": language == null ? null : language.toJson(),
        "aliases":
            aliases == null ? null : List<dynamic>.from(aliases.map((x) => x)),
      };
}

class Ability {
  int slot;
  int abilityId;

  Ability({
    this.slot,
    this.abilityId,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        slot: json["slot"] == null ? null : json["slot"],
        abilityId: json["abilityId"] == null ? null : json["abilityId"],
      );

  Map<String, dynamic> toJson() => {
        "slot": slot == null ? null : slot,
        "abilityId": abilityId == null ? null : abilityId,
      };
}

class Language {
  int heroId;
  int gameVersionId;
  int languageId;
  String displayName;
  String bio;
  String hype;

  Language({
    this.heroId,
    this.gameVersionId,
    this.languageId,
    this.displayName,
    this.bio,
    this.hype,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        heroId: json["heroId"] == null ? null : json["heroId"],
        gameVersionId:
            json["gameVersionId"] == null ? null : json["gameVersionId"],
        languageId: json["languageId"] == null ? null : json["languageId"],
        displayName: json["displayName"] == null ? null : json["displayName"],
        bio: json["bio"] == null ? null : json["bio"],
        hype: json["hype"] == null ? null : json["hype"],
      );

  Map<String, dynamic> toJson() => {
        "heroId": heroId == null ? null : heroId,
        "gameVersionId": gameVersionId == null ? null : gameVersionId,
        "languageId": languageId == null ? null : languageId,
        "displayName": displayName == null ? null : displayName,
        "bio": bio == null ? null : bio,
        "hype": hype == null ? null : hype,
      };
}

class Role {
  int roleId;
  int level;

  Role({
    this.roleId,
    this.level,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        roleId: json["roleId"] == null ? null : json["roleId"],
        level: json["level"] == null ? null : json["level"],
      );

  Map<String, dynamic> toJson() => {
        "roleId": roleId == null ? null : roleId,
        "level": level == null ? null : level,
      };
}

class Stat {
  int gameVersionId;
  bool enabled;
  int heroUnlockOrder;
  bool team;
  bool cmEnabled;
  bool newPlayerEnabled;
  AttackType attackType;
  double startingArmor;
  int startingMagicArmor;
  int startingDamageMin;
  int startingDamageMax;
  double attackRate;
  double attackAnimationPoint;
  int attackAcquisitionRange;
  int attackRange;
  PrimaryAttribute primaryAttribute;
  int heroPrimaryAttribute;
  int strengthBase;
  double strengthGain;
  int intelligenceBase;
  double intelligenceGain;
  int agilityBase;
  double agilityGain;
  double hpRegen;
  double mpRegen;
  int moveSpeed;
  double moveTurnRate;
  int hpBarOffset;
  int visionDaytimeRange;
  int visionNighttimeRange;
  int complexity;

  Stat({
    this.gameVersionId,
    this.enabled,
    this.heroUnlockOrder,
    this.team,
    this.cmEnabled,
    this.newPlayerEnabled,
    this.attackType,
    this.startingArmor,
    this.startingMagicArmor,
    this.startingDamageMin,
    this.startingDamageMax,
    this.attackRate,
    this.attackAnimationPoint,
    this.attackAcquisitionRange,
    this.attackRange,
    this.primaryAttribute,
    this.heroPrimaryAttribute,
    this.strengthBase,
    this.strengthGain,
    this.intelligenceBase,
    this.intelligenceGain,
    this.agilityBase,
    this.agilityGain,
    this.hpRegen,
    this.mpRegen,
    this.moveSpeed,
    this.moveTurnRate,
    this.hpBarOffset,
    this.visionDaytimeRange,
    this.visionNighttimeRange,
    this.complexity,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        gameVersionId:
            json["gameVersionId"] == null ? null : json["gameVersionId"],
        enabled: json["enabled"] == null ? null : json["enabled"],
        heroUnlockOrder:
            json["heroUnlockOrder"] == null ? null : json["heroUnlockOrder"],
        team: json["team"] == null ? null : json["team"],
        cmEnabled: json["cmEnabled"] == null ? null : json["cmEnabled"],
        newPlayerEnabled:
            json["newPlayerEnabled"] == null ? null : json["newPlayerEnabled"],
        attackType: json["attackType"] == null
            ? null
            : attackTypeValues.map[json["attackType"]],
        startingArmor: json["startingArmor"] == null
            ? null
            : json["startingArmor"].toDouble(),
        startingMagicArmor: json["startingMagicArmor"] == null
            ? null
            : json["startingMagicArmor"],
        startingDamageMin: json["startingDamageMin"] == null
            ? null
            : json["startingDamageMin"],
        startingDamageMax: json["startingDamageMax"] == null
            ? null
            : json["startingDamageMax"],
        attackRate:
            json["attackRate"] == null ? null : json["attackRate"].toDouble(),
        attackAnimationPoint: json["attackAnimationPoint"] == null
            ? null
            : json["attackAnimationPoint"].toDouble(),
        attackAcquisitionRange: json["attackAcquisitionRange"] == null
            ? null
            : json["attackAcquisitionRange"],
        attackRange: json["attackRange"] == null ? null : json["attackRange"],
        primaryAttribute: json["primaryAttribute"] == null
            ? null
            : primaryAttributeValues.map[json["primaryAttribute"]],
        heroPrimaryAttribute: json["heroPrimaryAttribute"] == null
            ? null
            : json["heroPrimaryAttribute"],
        strengthBase:
            json["strengthBase"] == null ? null : json["strengthBase"],
        strengthGain: json["strengthGain"] == null
            ? null
            : json["strengthGain"].toDouble(),
        intelligenceBase:
            json["intelligenceBase"] == null ? null : json["intelligenceBase"],
        intelligenceGain: json["intelligenceGain"] == null
            ? null
            : json["intelligenceGain"].toDouble(),
        agilityBase: json["agilityBase"] == null ? null : json["agilityBase"],
        agilityGain:
            json["agilityGain"] == null ? null : json["agilityGain"].toDouble(),
        hpRegen: json["hpRegen"] == null ? null : json["hpRegen"].toDouble(),
        mpRegen: json["mpRegen"] == null ? null : json["mpRegen"].toDouble(),
        moveSpeed: json["moveSpeed"] == null ? null : json["moveSpeed"],
        moveTurnRate: json["moveTurnRate"] == null
            ? null
            : json["moveTurnRate"].toDouble(),
        hpBarOffset: json["hpBarOffset"] == null ? null : json["hpBarOffset"],
        visionDaytimeRange: json["visionDaytimeRange"] == null
            ? null
            : json["visionDaytimeRange"],
        visionNighttimeRange: json["visionNighttimeRange"] == null
            ? null
            : json["visionNighttimeRange"],
        complexity: json["complexity"] == null ? null : json["complexity"],
      );

  Map<String, dynamic> toJson() => {
        "gameVersionId": gameVersionId == null ? null : gameVersionId,
        "enabled": enabled == null ? null : enabled,
        "heroUnlockOrder": heroUnlockOrder == null ? null : heroUnlockOrder,
        "team": team == null ? null : team,
        "cmEnabled": cmEnabled == null ? null : cmEnabled,
        "newPlayerEnabled": newPlayerEnabled == null ? null : newPlayerEnabled,
        "attackType":
            attackType == null ? null : attackTypeValues.reverse[attackType],
        "startingArmor": startingArmor == null ? null : startingArmor,
        "startingMagicArmor":
            startingMagicArmor == null ? null : startingMagicArmor,
        "startingDamageMin":
            startingDamageMin == null ? null : startingDamageMin,
        "startingDamageMax":
            startingDamageMax == null ? null : startingDamageMax,
        "attackRate": attackRate == null ? null : attackRate,
        "attackAnimationPoint":
            attackAnimationPoint == null ? null : attackAnimationPoint,
        "attackAcquisitionRange":
            attackAcquisitionRange == null ? null : attackAcquisitionRange,
        "attackRange": attackRange == null ? null : attackRange,
        "primaryAttribute": primaryAttribute == null
            ? null
            : primaryAttributeValues.reverse[primaryAttribute],
        "heroPrimaryAttribute":
            heroPrimaryAttribute == null ? null : heroPrimaryAttribute,
        "strengthBase": strengthBase == null ? null : strengthBase,
        "strengthGain": strengthGain == null ? null : strengthGain,
        "intelligenceBase": intelligenceBase == null ? null : intelligenceBase,
        "intelligenceGain": intelligenceGain == null ? null : intelligenceGain,
        "agilityBase": agilityBase == null ? null : agilityBase,
        "agilityGain": agilityGain == null ? null : agilityGain,
        "hpRegen": hpRegen == null ? null : hpRegen,
        "mpRegen": mpRegen == null ? null : mpRegen,
        "moveSpeed": moveSpeed == null ? null : moveSpeed,
        "moveTurnRate": moveTurnRate == null ? null : moveTurnRate,
        "hpBarOffset": hpBarOffset == null ? null : hpBarOffset,
        "visionDaytimeRange":
            visionDaytimeRange == null ? null : visionDaytimeRange,
        "visionNighttimeRange":
            visionNighttimeRange == null ? null : visionNighttimeRange,
        "complexity": complexity == null ? null : complexity,
      };
}

enum AttackType { MELEE, RANGED }

final attackTypeValues =
    EnumValues({"Melee": AttackType.MELEE, "Ranged": AttackType.RANGED});

enum PrimaryAttribute { AGI, STR, INT }

final primaryAttributeValues = EnumValues({
  "agi": PrimaryAttribute.AGI,
  "int": PrimaryAttribute.INT,
  "str": PrimaryAttribute.STR
});

class Talent {
  int slot;
  int gameVersionId;
  int abilityId;

  Talent({
    this.slot,
    this.gameVersionId,
    this.abilityId,
  });

  factory Talent.fromJson(Map<String, dynamic> json) => Talent(
        slot: json["slot"] == null ? null : json["slot"],
        gameVersionId:
            json["gameVersionId"] == null ? null : json["gameVersionId"],
        abilityId: json["abilityId"] == null ? null : json["abilityId"],
      );

  Map<String, dynamic> toJson() => {
        "slot": slot == null ? null : slot,
        "gameVersionId": gameVersionId == null ? null : gameVersionId,
        "abilityId": abilityId == null ? null : abilityId,
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
