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

  Future<List<int>> createItemList() async {
    return widget._memoizer.runOnce(() async {
      return widget.player.itemList
          .where((item) => item != null && item != 0)
          .toList();
    });
  }

  Future<List<String>> initializeUrlList() async {
    return createItemList().then((result) {
      return itemUrlList(result);
    });
  }

  Future<List<String>> itemUrlList(List<int> itemIds) async {
    return Future.wait(itemIds.map((item) {
      return itemUrlLookup(item);
    }));
  }

  Future<String> itemUrlLookup(int item) async {
    return DatabaseHelper.instance.getImageUrl(item);
  }

  @override
  void initState() {
    itemUrls = initializeUrlList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: itemUrls,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Container(
                height: 30.0,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, int) {
                      return Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(shape: BoxShape.rectangle),
                          child: Image.network(snapshot.data[int] != null
                              ? "http://cdn.dota2.com/apps/dota2/images/items/" +
                                  snapshot.data[int]
                              : "https://cdn.pixabay.com/photo/2017/03/05/17/02/placeholder-2119099_960_720.jpg"));
                    }));
          }
          return Container();
        });
  }
}
