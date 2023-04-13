import 'package:bi_launcher/providers/sectionControls.dart';
import 'package:flutter/material.dart';

class HeaderWidgets extends StatelessWidget {
  final HeaderMoviesCtrl isHeaderMovie;
  HeaderWidgets({Key? key, required this.isHeaderMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !isHeaderMovie.isHeaderMovie,
      child: Container(
        color: Colors.blue,
        height: 200,
        width: 400,
      ),
    );
  }
}
