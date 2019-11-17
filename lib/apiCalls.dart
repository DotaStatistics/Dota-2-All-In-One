import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:dota_stats/models/playerResults.dart';
import 'package:dota_stats/models/playerDetails.dart';
import 'package:dota_stats/models/dotaMatch.dart';

Future<PlayerResults> fetchPlayerResults(String query) async {
  final response =
  await http.get('https://api.stratz.com/api/v1/search/player?q=' + query +
     '&lastSeen="' + DateTime(
      DateTime.now().year,DateTime.now().month - 1)
      .millisecondsSinceEpoch.toString() + '"'
  );
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return PlayerResults.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

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

Future<List<DotaMatch>> fetchRecentMatches(String query) async {
  final response =
  await http.get('https://api.stratz.com/api/v1/Player/' + query + "/matches");
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return recentMatchesResultsFromJson(response.body);
  }
  else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load matches');
  }
}

//TODO implement an API-Call to get an up-to-date List of Heroes


//TODO implement an API-Call to get an up-to-date List of Items