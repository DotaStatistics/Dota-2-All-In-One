import 'package:flutter/material.dart';
import 'package:dota_stats/styles/fontStyles.dart';

class RegionFilterDropdownButton extends StatefulWidget {
  final void Function(int id) updateRegion;
  RegionFilterDropdownButton(this.updateRegion);
  @override
  _RegionFilterState createState() => _RegionFilterState();

}

class _RegionFilterState extends State<RegionFilterDropdownButton> {

  String dropdownValue = 'US West';
  int regionIndex = 1;
  var regions = <String>[
    'US West',
    'US East',
    'EUW',
    'SE Asia',
    'Dubai',
    'AUS',
    'Russia',
    'EU East',
    'S-Americe',
    'S-Africa',
    'China',
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.filter_list,
      color: Colors.white70),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(
          color: Colors.redAccent
      ),
      underline: Container(
        height: 2,
        color: Colors.black54,
      ),
      onChanged: (String newValue) {
        widget.updateRegion(regions.indexOf(newValue)+1);
        setState(() {
          dropdownValue = newValue;
        });
      },
      items:
      regions.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value)
        );
      }).toList(),
    );
  }


}

