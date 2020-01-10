import 'dart:convert';

List<Role> roleFromJson(String str) => List<Role>.from(json.decode(str).map((x) => Role.fromJson(x)));

String roleToJson(List<Role> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Role {
  int id;
  String name;
  String langKey;

  Role({
    this.id,
    this.name,
    this.langKey,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
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
