import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotifyver1/data/data.dart';
import 'package:spotifyver1/themechanger.dart';
import 'package:provider/provider.dart';

import 'widget.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({Key? key}) : super(key: key);

  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leadingWidth: 100.0,
        leading: (MediaQuery.of(context).size.width > 600)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    customBorder: const CircleBorder(),
                    child: Ink(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: context.watch<ThemeChanger>().darktheme
                            ? Colors.white.withOpacity(0.3)
                            : Colors.black.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.chevron_left),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    customBorder: const CircleBorder(),
                    child: Ink(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: context.watch<ThemeChanger>().darktheme
                            ? Colors.white.withOpacity(0.3)
                            : Colors.black.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.chevron_right),
                    ),
                  ),
                ],
              )
            : IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          alignment: Alignment.centerLeft,
                          contentPadding: const EdgeInsets.all(0.0),
                          content: SideMenu(),
                        );
                      });
                },
                icon: const Icon(
                  Icons.menu,
                ),
              ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
            label: Text(
              "VAIBHAV",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_arrow_down_sharp,
                color: Theme.of(context).colorScheme.secondary),
          ),
          const SizedBox(
            width: 15.0,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.watch<ThemeChanger>().darktheme
                  ? Colors.red
                  : Colors.white,
              context.watch<ThemeChanger>().darktheme
                  ? Colors.black
                  : Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.3],
          ),
        ),
        child: Scrollbar(
            isAlwaysShown: true,
            child: ListView(
              padding:
                  const EdgeInsets.only(top: 90.0, left: 15.0, right: 10.0),
              children: [
                (MediaQuery.of(context).size.width > 600)
                    ? const SizedBox.shrink()
                    : playlistImage(),
                header(),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      child: Text("PLAY"),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.maxFinite,
                  child: ListOfSongs(songs: currentPlaylistSongs),
                ),
              ],
            )),
      ),
    );
  }
}

class header extends StatefulWidget {
  const header({
    Key? key,
  }) : super(key: key);

  @override
  State<header> createState() => _headerState();
}

class _headerState extends State<header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (MediaQuery.of(context).size.width > 600)
            ? playlistImage()
            : const SizedBox.shrink(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "PLAYLIST",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  currentplaylist.name,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  currentplaylist.description,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "created by :- ${currentplaylist.creator} duration :- ${currentplaylist.duration}",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class playlistImage extends StatelessWidget {
  const playlistImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Image.asset(
        currentplaylist.imageURL,
        width: 200.0,
        height: 200.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
