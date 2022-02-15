import 'package:flutter/material.dart';
import 'package:spotifyver1/data/data.dart';

class LibiraryPlaylist extends StatefulWidget {
  const LibiraryPlaylist({Key? key}) : super(key: key);

  @override
  _LibiraryPlaylistState createState() => _LibiraryPlaylistState();
}

class _LibiraryPlaylistState extends State<LibiraryPlaylist> {
  ScrollController? controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: controller,
        child: ListView(
          controller: controller,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Libirary",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            ...libirary
                .map(
                  (e) => GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          e,
                          style: Theme.of(context).textTheme.bodyText2,
                        )),
                  ),
                )
                .toList(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Playlist",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            ...playlists
                .map(
                  (e) => GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          e,
                          style: Theme.of(context).textTheme.bodyText2,
                        )),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
