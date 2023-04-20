import 'package:bi_launcher/providers/favProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget SectionTitle({required String title}) {
  return Consumer<FavMovieList>(
    builder: (context, favMovieList, child) {
      late bool isShow;
      if (favMovieList.appPackageNames.length != 0) {
        isShow = true;
      } else {
        isShow = false;
      }
      return Visibility(
        visible: isShow,
        child: Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.all(10),
          color: Colors.white12,
          child: Text(
            "$title",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    },
  );
}
