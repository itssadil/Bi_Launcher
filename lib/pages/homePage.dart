import 'package:flutter/material.dart';

import 'subPage/appsArea.dart';
import 'subPage/headerArea.dart';
import 'subPage/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HeaderArea(),
                AppsArea(),
              ],
            ),
            Sidebar(),
          ],
        ),
      ),
    );
  }
}
