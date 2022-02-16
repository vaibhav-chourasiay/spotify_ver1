import 'package:flutter/material.dart';
import 'package:spotifyver1/data/data.dart';
import 'package:provider/provider.dart';
import 'package:spotifyver1/selectdsong.dart';
import 'package:spotifyver1/themechanger.dart';

class ListOfSongs extends StatefulWidget {
  final List<Song> songs;
  const ListOfSongs({Key? key, required this.songs}) : super(key: key);

  @override
  _ListOfSongsState createState() => _ListOfSongsState();
}

class _ListOfSongsState extends State<ListOfSongs> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: context.watch<ThemeChanger>().darktheme
            ? Colors.white54
            : Colors.black,
      ),
      child: DataTable(
        showCheckboxColumn: false,
        columnSpacing: 10.0,
        columns: [
          DataColumn(
            label: Text(
              "title",
              style: TextStyle(
                  fontSize:
                      (MediaQuery.of(context).size.width < 400) ? 10.0 : 16.0,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          DataColumn(
            label: Text(
              "artist",
              style: TextStyle(
                  fontSize:
                      (MediaQuery.of(context).size.width < 400) ? 10.0 : 16.0,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          DataColumn(
            label: Text(
              "album",
              style: TextStyle(
                  fontSize:
                      (MediaQuery.of(context).size.width < 400) ? 10.0 : 16.0,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          DataColumn(
            label: Text(
              "duration",
              style: TextStyle(
                  fontSize:
                      (MediaQuery.of(context).size.width < 400) ? 10.0 : 16.0,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ),
        ],
        rows: widget.songs
            .map(
              (e) => datarow(context, e),
            )
            .toList(),
      ),
    );
  }

  DataRow datarow(BuildContext context, Song e) {
    bool selected = context.watch<SelectedSong>().song?.id == e.id;
    return DataRow(
      color: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected))
          return Theme.of(context).colorScheme.secondary.withOpacity(0.08);
        return null; // Use the default value.
      }),
      selected: selected,
      onSelectChanged: (i) {
        context.read<SelectedSong>().selected(e);
      },
      cells: [
        DataCell(
          Text(
            e.title,
            style: TextStyle(
                fontSize:
                    (MediaQuery.of(context).size.width < 400) ? 10.0 : 16.0,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          Text(
            e.artist,
            style: TextStyle(
                fontSize:
                    (MediaQuery.of(context).size.width < 400) ? 10.0 : 16.0,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          Text(
            e.album,
            style: TextStyle(
                fontSize:
                    (MediaQuery.of(context).size.width < 400) ? 10.0 : 16.0,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          Text(
            e.duration,
            style: TextStyle(
                fontSize:
                    (MediaQuery.of(context).size.width < 400) ? 10.0 : 16.0,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}
