import 'package:dota_stats/database.dart';
import 'package:flutter/material.dart';
import 'package:dota_stats/models/dotaMatch.dart';
import 'package:dota_stats/database.dart';

class PurchasedItemsList extends StatefulWidget {
  final Player player;
  PurchasedItemsList(this.player);

  @override
  _PurchasedItemsListState createState() => _PurchasedItemsListState();
  }

class _PurchasedItemsListState extends State<PurchasedItemsList> {

  List<int> items;
  Future<List<DBItem>> itemResult;




  @override
  void initState() {

    //getItems();
    items.add(widget.player.item0Id);
    items.add(widget.player.item1Id);
    items.add(widget.player.item2Id);
    items.add(widget.player.item3Id);
    items.add(widget.player.item4Id);
    items.add(widget.player.item5Id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, int) {
            return Container(
              width: 25.0,
              height: 25.0,
              decoration: BoxDecoration(shape: BoxShape.rectangle),
                child: Image.network(
                    "http://cdn.dota2.com/apps/dota2/images/items/"
            ));
          }
        );

  }
}

