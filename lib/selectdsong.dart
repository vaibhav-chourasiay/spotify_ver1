import 'package:flutter/material.dart';

import 'data/data.dart';

class SelectedSong extends ChangeNotifier {
  Song? song;

  selected(Song song) {
    this.song = song;
    notifyListeners();
  }
}
