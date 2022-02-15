import 'package:flutter/material.dart';
import 'package:spotifyver1/themechanger.dart';
import 'package:provider/provider.dart';

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
      color: Theme.of(context).colorScheme.primary,
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
          MenuButton(icondata: Icons.home, title: "Home", onpressed: () {}),
          MenuButton(icondata: Icons.search, title: "Search", onpressed: () {}),
          MenuButton(
              icondata: Icons.audiotrack, title: "audio", onpressed: () {}),
          Switch(
            activeColor: Colors.green,
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

class MenuButton extends StatefulWidget {
  final icondata;
  final title;
  Function onpressed;

  MenuButton({Key? key, this.icondata, this.title, required this.onpressed})
      : super(key: key);

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          leading: Icon(widget.icondata),
          onTap: widget.onpressed(),
        ),
        Divider(
          color: context.watch<ThemeChanger>().darktheme
              ? Colors.white
              : Colors.black45,
        ),
      ],
    );
  }
}
