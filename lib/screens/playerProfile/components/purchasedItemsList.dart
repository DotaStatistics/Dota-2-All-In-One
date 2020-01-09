import 'package:dota_stats/database.dart';
import 'package:flutter/material.dart';
import 'package:dota_stats/models/dotaMatch.dart';
import 'package:dota_stats/database.dart';
import 'package:http/http.dart';

class PurchasedItemsList extends StatefulWidget {
  final Player player;
  PurchasedItemsList(this.player);

  @override
  _PurchasedItemsListState createState() => _PurchasedItemsListState();
  }

class _PurchasedItemsListState extends State<PurchasedItemsList> {

  List<int> itemIds = [];

  void fillItemList() {
    if (widget.player.item0Id != 0) {
      itemIds.add(widget.player.item0Id);
    }
    if (widget.player.item1Id != 0) {
      itemIds.add(widget.player.item1Id);
    }
    if (widget.player.item2Id != 0) {
      itemIds.add(widget.player.item2Id);
    }
    if (widget.player.item3Id != 0) {
      itemIds.add(widget.player.item3Id);
    }
    if (widget.player.item4Id != 0) {
      itemIds.add(widget.player.item4Id);
    }
    if (widget.player.item5Id != 0) {
      itemIds.add(widget.player.item5Id);
    }
  }
    @override
  void initState() {
    fillItemList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: DatabaseHelper.instance.getImageUrl(itemIds),
        builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.done){
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, int) {
                return Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: BoxDecoration(shape: BoxShape.rectangle),
                    child: Image.network(
                        "http://cdn.dota2.com/apps/dota2/images/items/" + snapshot.data[int]
                    ));
              }
          );
        }
        return Container();
        }
    );

  }
}

