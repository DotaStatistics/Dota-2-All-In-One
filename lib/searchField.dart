import 'package:flutter/material.dart';


class SearchPlayers extends StatefulWidget {
  SearchPlayers();

  @override
  _SearchPlayersState createState() => _SearchPlayersState();
}

class _SearchPlayersState extends State<SearchPlayers> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Pawn a Noob!',
      ),
      onSubmitted: (String query) {
        controller.text = '';
      },
    );
  }
}
