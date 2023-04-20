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

  Future addFavMovieList(newFav, context) async {
    if (_appPackageNames.contains(newFav)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.indigo,
          content: Center(
            child: Text(
              'Youtube is already in the favorites list',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      _appPackageNames.add(newFav);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setStringList('prefAppPackageNames', _appPackageNames);
    }
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
