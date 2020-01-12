import 'package:dota_stats/models/gameModes.dart';
import 'package:dota_stats/models/role.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:dota_stats/models/playerResults.dart';
import 'package:dota_stats/models/playerDetails.dart';
import 'package:dota_stats/models/dotaMatch.dart';
import 'package:dota_stats/models/playerInfo.dart';
import 'models/item.dart';
import 'models/matchDetails.dart';

Future<PlayerResults> fetchPlayerResults(String query, int region) async {
  final response = await http.get(
      'https://api.stratz.com/api/v1/search/player?q=' +
          query +
          '&regionId=[' +
          region.toString() +
          ']&lastSeen="' +
          DateTime(DateTime.now().year, DateTime.now().month - 1)
              .millisecondsSinceEpoch
              .toString() +
          '"');
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return PlayerResults.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<PlayerInfo> fetchPlayerInfo(String steamId) async {
  PlayerDetails playerDetails;
  List<DotaMatch> matches;
  final response =
      await http.get('https://api.stratz.com/api/v1/Player/' + steamId);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    playerDetails = PlayerDetails.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }

  final response2 = await http
      .get('https://api.stratz.com/api/v1/Player/' + steamId + "/matches");
  if (response2.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    matches = recentMatchesResultsFromJson(response2.body);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load matches');
  }
  return PlayerInfo(playerDetails, matches);
}

Future<Map<String, Item>> fetchItemList() async {
  final response = await http.get('https://api.stratz.com/api/v1/Item');
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return itemFromJson(response.body);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load items');
  }
}

Future<Map<String, GameMode>> fetchGameModeList() async {
  final response = await http.get('https://api.stratz.com/api/v1/GameMode');
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return gameModeFromJson(response.body);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load gamemodes');
  }
}

Future<List<Role>> fetchRoleList() async {
  final response = await http.get('https://api.stratz.com/api/v1/Hero/roles');
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return roleFromJson(response.body);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load roles');
  }
}

Future<MatchDetails> fetchMatchDetails(int id) async {
  final response = await http
      .get('https://api.stratz.com/api/v1/match?matchId=' + id.toString());
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return matchDetailsFromJson(response.body);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load MatchDetails');
  }
}

Future<String> fetchPlayerNameFromId(int id) async {
  final response =
      await http.get('https://api.stratz.com/api/v1/Player/' + id.toString());
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    var parsedJson = json.decode(response.body);
    return parsedJson["steamAccount"]["name"];
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load MatchDetails');
  }
}
