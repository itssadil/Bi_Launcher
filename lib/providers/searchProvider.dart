import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  bool _isShowSearch = false;
  bool get isShowSearch => _isShowSearch;

  Icon _srcIcon = Icon(Icons.search);
  Icon get srcIcon => _srcIcon;

  cngShowSearch() {
    _isShowSearch = !_isShowSearch;
    // _srcIcon = _srcIcon != Icon(Icons.search)
    //     ? Icon(Icons.cancel)
    //     : Icon(Icons.search);

    notifyListeners();
  }
}
