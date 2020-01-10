import 'package:dota_stats/database.dart';
import 'package:flutter/material.dart';
import 'package:dota_stats/models/dotaMatch.dart';
import 'package:async/async.dart';

class PurchasedItemsList extends StatefulWidget {
  final Player player;
  final AsyncMemoizer<List<int>> _memoizer = AsyncMemoizer<List<int>>();
  PurchasedItemsList(this.player);

  @override
  _PurchasedItemsListState createState() => _PurchasedItemsListState();
  }

class _PurchasedItemsListState extends State<PurchasedItemsList> {
  Future<List<String>> itemUrls;

  //TODO Liste im Model initialisieren
  Future<List<int>> createItemList() async {
    return widget._memoizer.runOnce(() async{
      List<int> itemIds =[];
      if (widget.player.item0Id != 0 && widget.player.item0Id != null) {
        itemIds.add(widget.player.item0Id);
      }
      if (widget.player.item1Id != 0 && widget.player.item1Id != null) {
        itemIds.add(widget.player.item1Id);
      }
      if (widget.player.item2Id != 0 && widget.player.item2Id != null) {
        itemIds.add(widget.player.item2Id);
      }
      if (widget.player.item3Id != 0 && widget.player.item3Id != null) {
        itemIds.add(widget.player.item3Id);
      }
      if (widget.player.item4Id != 0 && widget.player.item4Id != null) {
        itemIds.add(widget.player.item4Id);
      }
      if (widget.player.item5Id != 0 && widget.player.item5Id != null) {
        itemIds.add(widget.player.item5Id);
      }
      return itemIds;
    });
  }

  Future<List<String>> initialize() async {
    return createItemList().then((result) {
      return itemUrlList(result);
    });
  }

  Future<List<String>> itemUrlList(List<int> itemIds) async {
    return Future.wait(itemIds.map((item) {
      return itemUrlLookup(item);
    }));
  }

  Future<String> itemUrlLookup(int item) async{
    return DatabaseHelper.instance.getImageUrl(item);
  }

    @override
  void initState() {
      itemUrls = initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: itemUrls,
        builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          return Container(

              height: 30.0,
              child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (context, int) {
                return Container(
                    width:30.0,
                    height: 30.0,
                    decoration: BoxDecoration(shape: BoxShape.rectangle),
                    child: Image.network(
                        "http://cdn.dota2.com/apps/dota2/images/items/" + snapshot.data[int]
                    ));
              }
          ));
        }
        return Container();
        }
    );

  }
}

