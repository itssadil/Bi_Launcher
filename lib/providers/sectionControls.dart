import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*===============================================================
                      HEADER MOVIE CONTROL
================================================================*/

class HeaderMoviesCtrl extends ChangeNotifier {
  bool _isHeaderMovie = true;
  bool get isHeaderMovie => _isHeaderMovie;

  HeaderMoviesCtrl() {
    initialState();
  }

  void initialState() {
    syncDataWithProvider();
  }

  Future cngHeaderMovie() async {
    _isHeaderMovie = !_isHeaderMovie;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('prefHeaderMovie', _isHeaderMovie);

    notifyListeners();
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var reslut = prefs.getBool('prefHeaderMovie');

    if (reslut != null) {
      _isHeaderMovie = reslut;
    }

    notifyListeners();
  }
}
/*===============================================================
                      FAVORITE CONTROL
================================================================*/

class FavCtrl extends ChangeNotifier {
  bool _isFav = true;
  bool get isFav => _isFav;

  FavCtrl() {
    initialState();
  }

  void initialState() {
    syncDataWithProvider();
  }

  Future cngFav() async {
    _isFav = !_isFav;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('prefFavMovie', _isFav);

    notifyListeners();
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var reslut = prefs.getBool('prefFavMovie');

    if (reslut != null) {
      _isFav = reslut;
    }

    notifyListeners();
  }
}

/*===============================================================
                      MOVIES SITE CONTROL
================================================================*/

class SiteCtrl extends ChangeNotifier {
  bool _isSite = true;
  bool get isSite => _isSite;

  SiteCtrl() {
    initialState();
  }

  void initialState() {
    syncDataWithProvider();
  }

  Future cngSite() async {
    _isSite = !_isSite;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('prefSiteLink', _isSite);

    notifyListeners();
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var reslut = prefs.getBool('prefSiteLink');

    if (reslut != null) {
      _isSite = reslut;
    }

    notifyListeners();
  }
}

/*===============================================================
                      SIDEBAR CONTROL
================================================================*/

class SidebarCtrl extends ChangeNotifier {
  bool _isSidebar = true;
  bool get isSidebar => _isSidebar;

  SidebarCtrl() {
    initialState();
  }

  void initialState() {
    syncDataWithProvider();
  }

  Future cngSidebarCtrl() async {
    _isSidebar = !_isSidebar;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('presSidebar', _isSidebar);

    notifyListeners();
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var reslut = prefs.getBool('presSidebar');

    if (reslut != null) {
      _isSidebar = reslut;
    }

    notifyListeners();
  }
}
