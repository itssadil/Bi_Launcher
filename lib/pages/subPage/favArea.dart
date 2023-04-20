import 'package:bi_launcher/providers/sectionControls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavArea extends StatelessWidget {
  const FavArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavCtrl>(
      builder: (context, isFav, child) {
        return Visibility(
          visible: isFav.isFav,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
