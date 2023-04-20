import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavMovieList extends ChangeNotifier {
  List<String> _appPackageNames = [];

  List<String> get appPackageNames => _appPackageNames;

  FavMovieList() {
    initialState();
  }

  void initialState() {
    syncDataWithProvider();
  }

  Future addFavMovieList(newFav) async {
    _appPackageNames.add(newFav);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('prefAppPackageNames', _appPackageNames);

    notifyListeners();
  }

  Future removeFavMovieList(removeFav) async {
    _appPackageNames.remove(removeFav);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList('prefAppPackageNames', _appPackageNames);

    notifyListeners();
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var reslut = prefs.getStringList('prefAppPackageNames');

    if (reslut != null) {
      _appPackageNames = reslut;
    }

    notifyListeners();
  }
}
