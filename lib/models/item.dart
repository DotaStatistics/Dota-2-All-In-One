// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

Map<String, Item> itemFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Item>(k, Item.fromJson(v)));

String itemToJson(Map<String, Item> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Item {
  int id;
  String name;
  String displayName;
  String shortName;
  Language language;
  Stat stat;
  String image;
  bool isInNeuralNetwork;
  bool isFullItemHeroPurchaseItem;
  List<Component> components;
  bool isSupportFullItem;

  Item({
    this.id,
    this.name,
    this.displayName,
    this.shortName,
    this.language,
    this.stat,
    this.image,
    this.isInNeuralNetwork,
    this.isFullItemHeroPurchaseItem,
    this.components,
    this.isSupportFullItem,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    displayName: json["displayName"] == null ? null : json["displayName"],
    shortName: json["shortName"] == null ? null : json["shortName"],
    language: json["language"] == null ? null : Language.fromJson(json["language"]),
    stat: json["stat"] == null ? null : Stat.fromJson(json["stat"]),
    image: json["image"] == null ? null : json["image"],
    isInNeuralNetwork: json["isInNeuralNetwork"] == null ? null : json["isInNeuralNetwork"],
    isFullItemHeroPurchaseItem: json["isFullItemHeroPurchaseItem"] == null ? null : json["isFullItemHeroPurchaseItem"],
    components: json["components"] == null ? null : List<Component>.from(json["components"].map((x) => Component.fromJson(x))),
    isSupportFullItem: json["isSupportFullItem"] == null ? null : json["isSupportFullItem"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "displayName": displayName == null ? null : displayName,
    "shortName": shortName == null ? null : shortName,
    "language": language == null ? null : language.toJson(),
    "stat": stat == null ? null : stat.toJson(),
    "image": image == null ? null : image,
    "isInNeuralNetwork": isInNeuralNetwork == null ? null : isInNeuralNetwork,
    "isFullItemHeroPurchaseItem": isFullItemHeroPurchaseItem == null ? null : isFullItemHeroPurchaseItem,
    "components": components == null ? null : List<dynamic>.from(components.map((x) => x.toJson())),
    "isSupportFullItem": isSupportFullItem == null ? null : isSupportFullItem,
  };
}

class Component {
  int index;
  int componentId;

  Component({
    this.index,
    this.componentId,
  });

  factory Component.fromJson(Map<String, dynamic> json) => Component(
    index: json["index"] == null ? null : json["index"],
    componentId: json["componentId"] == null ? null : json["componentId"],
  );

  Map<String, dynamic> toJson() => {
    "index": index == null ? null : index,
    "componentId": componentId == null ? null : componentId,
  };
}

class Language {
  String displayName;
  List<String> lore;
  List<String> description;
  List<String> notes;
  List<String> attributes;

  Language({
    this.displayName,
    this.lore,
    this.description,
    this.notes,
    this.attributes,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    displayName: json["displayName"] == null ? null : json["displayName"],
    lore: json["lore"] == null ? null : List<String>.from(json["lore"].map((x) => x)),
    description: json["description"] == null ? null : List<String>.from(json["description"].map((x) => x)),
    notes: json["notes"] == null ? null : List<String>.from(json["notes"].map((x) => x)),
    attributes: json["attributes"] == null ? null : List<String>.from(json["attributes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "displayName": displayName == null ? null : displayName,
    "lore": lore == null ? null : List<dynamic>.from(lore.map((x) => x)),
    "description": description == null ? null : List<dynamic>.from(description.map((x) => x)),
    "notes": notes == null ? null : List<dynamic>.from(notes.map((x) => x)),
    "attributes": attributes == null ? null : List<dynamic>.from(attributes.map((x) => x)),
  };
}

class Stat {
  int behavior;
  int unitTargetType;
  int unitTargetTeam;
  int unitTargetFlags;
  int fightLevelRecap;
  List<int> castRange;
  List<double> castPoint;
  List<double> cooldown;
  List<int> manaCost;
  SharedCooldown sharedCooldown;
  int cost;
  String shopTags;
  String aliases;
  String quality;
  bool isSellable;
  bool isDroppable;
  bool isPurchaseable;
  bool isSecretShop;
  bool isSideShop;
  bool isStackable;
  bool isPermanent;
  bool isHideCharges;
  bool isRequiresCharges;
  bool isDisplayCharges;
  bool isSupport;
  bool isTempestDoubleClonable;
  int stockMax;
  int initialCharges;
  int initialStock;
  int stockTime;
  int initialStockTime;
  bool isRecipe;
  bool needsComponents;
  bool isAlertable;
  List<double> channelTime;

  Stat({
    this.behavior,
    this.unitTargetType,
    this.unitTargetTeam,
    this.unitTargetFlags,
    this.fightLevelRecap,
    this.castRange,
    this.castPoint,
    this.cooldown,
    this.manaCost,
    this.sharedCooldown,
    this.cost,
    this.shopTags,
    this.aliases,
    this.quality,
    this.isSellable,
    this.isDroppable,
    this.isPurchaseable,
    this.isSecretShop,
    this.isSideShop,
    this.isStackable,
    this.isPermanent,
    this.isHideCharges,
    this.isRequiresCharges,
    this.isDisplayCharges,
    this.isSupport,
    this.isTempestDoubleClonable,
    this.stockMax,
    this.initialCharges,
    this.initialStock,
    this.stockTime,
    this.initialStockTime,
    this.isRecipe,
    this.needsComponents,
    this.isAlertable,
    this.channelTime,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    behavior: json["behavior"] == null ? null : json["behavior"],
    unitTargetType: json["unitTargetType"] == null ? null : json["unitTargetType"],
    unitTargetTeam: json["unitTargetTeam"] == null ? null : json["unitTargetTeam"],
    unitTargetFlags: json["unitTargetFlags"] == null ? null : json["unitTargetFlags"],
    fightLevelRecap: json["fightLevelRecap"] == null ? null : json["fightLevelRecap"],
    castRange: json["castRange"] == null ? null : List<int>.from(json["castRange"].map((x) => x)),
    castPoint: json["castPoint"] == null ? null : List<double>.from(json["castPoint"].map((x) => x.toDouble())),
    cooldown: json["cooldown"] == null ? null : List<double>.from(json["cooldown"].map((x) => x.toDouble())),
    manaCost: json["manaCost"] == null ? null : List<int>.from(json["manaCost"].map((x) => x)),
    sharedCooldown: json["sharedCooldown"] == null ? null : sharedCooldownValues.map[json["sharedCooldown"]],
    cost: json["cost"] == null ? null : json["cost"],
    shopTags: json["shopTags"] == null ? null : json["shopTags"],
    aliases: json["aliases"] == null ? null : json["aliases"],
    quality: json["quality"] == null ? null : json["quality"],
    isSellable: json["isSellable"] == null ? null : json["isSellable"],
    isDroppable: json["isDroppable"] == null ? null : json["isDroppable"],
    isPurchaseable: json["isPurchaseable"] == null ? null : json["isPurchaseable"],
    isSecretShop: json["isSecretShop"] == null ? null : json["isSecretShop"],
    isSideShop: json["isSideShop"] == null ? null : json["isSideShop"],
    isStackable: json["isStackable"] == null ? null : json["isStackable"],
    isPermanent: json["isPermanent"] == null ? null : json["isPermanent"],
    isHideCharges: json["isHideCharges"] == null ? null : json["isHideCharges"],
    isRequiresCharges: json["isRequiresCharges"] == null ? null : json["isRequiresCharges"],
    isDisplayCharges: json["isDisplayCharges"] == null ? null : json["isDisplayCharges"],
    isSupport: json["isSupport"] == null ? null : json["isSupport"],
    isTempestDoubleClonable: json["isTempestDoubleClonable"] == null ? null : json["isTempestDoubleClonable"],
    stockMax: json["stockMax"] == null ? null : json["stockMax"],
    initialCharges: json["initialCharges"] == null ? null : json["initialCharges"],
    initialStock: json["initialStock"] == null ? null : json["initialStock"],
    stockTime: json["stockTime"] == null ? null : json["stockTime"],
    initialStockTime: json["initialStockTime"] == null ? null : json["initialStockTime"],
    isRecipe: json["isRecipe"] == null ? null : json["isRecipe"],
    needsComponents: json["needsComponents"] == null ? null : json["needsComponents"],
    isAlertable: json["isAlertable"] == null ? null : json["isAlertable"],
    channelTime: json["channelTime"] == null ? null : List<double>.from(json["channelTime"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "behavior": behavior == null ? null : behavior,
    "unitTargetType": unitTargetType == null ? null : unitTargetType,
    "unitTargetTeam": unitTargetTeam == null ? null : unitTargetTeam,
    "unitTargetFlags": unitTargetFlags == null ? null : unitTargetFlags,
    "fightLevelRecap": fightLevelRecap == null ? null : fightLevelRecap,
    "castRange": castRange == null ? null : List<dynamic>.from(castRange.map((x) => x)),
    "castPoint": castPoint == null ? null : List<dynamic>.from(castPoint.map((x) => x)),
    "cooldown": cooldown == null ? null : List<dynamic>.from(cooldown.map((x) => x)),
    "manaCost": manaCost == null ? null : List<dynamic>.from(manaCost.map((x) => x)),
    "sharedCooldown": sharedCooldown == null ? null : sharedCooldownValues.reverse[sharedCooldown],
    "cost": cost == null ? null : cost,
    "shopTags": shopTags == null ? null : shopTags,
    "aliases": aliases == null ? null : aliases,
    "quality": quality == null ? null : quality,
    "isSellable": isSellable == null ? null : isSellable,
    "isDroppable": isDroppable == null ? null : isDroppable,
    "isPurchaseable": isPurchaseable == null ? null : isPurchaseable,
    "isSecretShop": isSecretShop == null ? null : isSecretShop,
    "isSideShop": isSideShop == null ? null : isSideShop,
    "isStackable": isStackable == null ? null : isStackable,
    "isPermanent": isPermanent == null ? null : isPermanent,
    "isHideCharges": isHideCharges == null ? null : isHideCharges,
    "isRequiresCharges": isRequiresCharges == null ? null : isRequiresCharges,
    "isDisplayCharges": isDisplayCharges == null ? null : isDisplayCharges,
    "isSupport": isSupport == null ? null : isSupport,
    "isTempestDoubleClonable": isTempestDoubleClonable == null ? null : isTempestDoubleClonable,
    "stockMax": stockMax == null ? null : stockMax,
    "initialCharges": initialCharges == null ? null : initialCharges,
    "initialStock": initialStock == null ? null : initialStock,
    "stockTime": stockTime == null ? null : stockTime,
    "initialStockTime": initialStockTime == null ? null : initialStockTime,
    "isRecipe": isRecipe == null ? null : isRecipe,
    "needsComponents": needsComponents == null ? null : needsComponents,
    "isAlertable": isAlertable == null ? null : isAlertable,
    "channelTime": channelTime == null ? null : List<dynamic>.from(channelTime.map((x) => x)),
  };
}

enum SharedCooldown { EMPTY, FORCE, DAGON, NECRONOMICON, SHADOW_BLADE, DIFFUSAL, ETHEREAL, MEDALLION, TRAVEL, ORCHID, TOME, URN, MAGICWAND, TELEPORT }

final sharedCooldownValues = EnumValues({
  "dagon": SharedCooldown.DAGON,
  "diffusal": SharedCooldown.DIFFUSAL,
  "": SharedCooldown.EMPTY,
  "ethereal": SharedCooldown.ETHEREAL,
  "force": SharedCooldown.FORCE,
  "magicwand": SharedCooldown.MAGICWAND,
  "medallion": SharedCooldown.MEDALLION,
  "necronomicon": SharedCooldown.NECRONOMICON,
  "orchid": SharedCooldown.ORCHID,
  "shadow_blade": SharedCooldown.SHADOW_BLADE,
  "teleport": SharedCooldown.TELEPORT,
  "tome": SharedCooldown.TOME,
  "travel": SharedCooldown.TRAVEL,
  "urn": SharedCooldown.URN
});

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
