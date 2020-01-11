import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:dota_stats/models/playerDetails.dart';
import 'package:dota_stats/styles/fontStyles.dart';

class ProfilePieChart extends StatelessWidget {
  final int  games;
  final int wins;
  ProfilePieChart(this.games, this.wins);

  Map<String, double> dataMap = new Map();

  List<Color> colorList = [
    Colors.green,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    dataMap.putIfAbsent("Wins", () => wins.toDouble());
    dataMap.putIfAbsent("Losses",
            () => ((games - wins).toDouble()));

    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32.0,
      chartRadius: MediaQuery.of(context).size.width / 4.7,
      showChartValuesInPercentage: true,
      showChartValues: true,
      showChartValuesOutside: false,
      chartValueBackgroundColor: Colors.grey[200],
      colorList: colorList,
      showLegends: true,
      legendPosition: LegendPosition.right,
      legendStyle: FontStyles.whiteText(),
      decimalPlaces: 1,
      showChartValueLabel: true,
      initialAngle: 0,
      chartValueStyle: defaultChartValueStyle.copyWith(
        color: Colors.blueGrey[900].withOpacity(0.9),
      ),
      chartType: ChartType.ring,
    );
  }
}
