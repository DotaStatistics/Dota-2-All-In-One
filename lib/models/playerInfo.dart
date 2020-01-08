import 'package:flutter/material.dart';
import 'playerDetails.dart';
import 'dotaMatch.dart';

class PlayerInfo {
  PlayerDetails details;
  List<DotaMatch> matches;
  PlayerInfo(this.details, this.matches);
}