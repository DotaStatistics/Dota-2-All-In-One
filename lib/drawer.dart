import 'package:flutter/material.dart';
import 'routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.search,
              text: 'Home',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.home)),
          _createDrawerItem(
              icon: Icons.person_pin,
              text: 'Herolist',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.heroes)),
          _createDrawerItem(
              icon: Icons.content_cut,
              text: 'Itemlist',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.items)),
          Divider(),
          _createDrawerItem(
            icon: Icons.settings,
            text: 'Settings',
            onTap: () =>
                //TODO settings route
                Navigator.pushReplacementNamed(context, Routes.home),
          )
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/logo.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Dota 2 All-In-One",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}