import 'dart:async';

import 'package:flutter/material.dart';

class WatchModel extends ChangeNotifier {
  String _time = DateTime.now().toString().substring(11, 19);

  String get time => _time;

  WatchModel() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _time = DateTime.now().toString().substring(11, 19);
      notifyListeners();
    });
  }
}
