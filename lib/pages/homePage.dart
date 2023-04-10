import 'package:flutter/material.dart';

import 'subPage/appsArea.dart';
import 'subPage/headerArea.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            HeaderArea(),
            AppsArea(),
          ],
        ),
      ),
    );
  }
}
