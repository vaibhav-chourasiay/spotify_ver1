import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:spotifyver1/themechanger.dart';

import 'widget.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      color: Colors.black,
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: Image.asset(
              "assets/spotify_logo.png",
              filterQuality: FilterQuality.medium,
              height: 60.0,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          MenuButton(context, Icons.home, "Home", () {}),
          MenuButton(context, Icons.search, "Search", () {}),
          MenuButton(context, Icons.audiotrack, "audio", () {}),
          Switch(
            value: !(context.watch<ThemeChanger>().darktheme),
            onChanged: (value) {
              context.read<ThemeChanger>().changetheme();
            },
          ),
          const SizedBox(
            height: 15.0,
          ),
          LibiraryPlaylist(),
        ],
      ),
    );
  }
}

Widget MenuButton(context, icondata, title, onpressed) {
  return Column(
    children: [
      ListTile(
        dense: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: Icon(icondata),
        onTap: onpressed,
      ),
      Divider(),
    ],
  );
}
