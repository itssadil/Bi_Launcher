import 'package:bi_launcher/widgets/allApps.dart';
import 'package:flutter/material.dart';

class AppsArea extends StatefulWidget {
  const AppsArea({Key? key}) : super(key: key);

  @override
  State<AppsArea> createState() => _AppsAreaState();
}

class _AppsAreaState extends State<AppsArea> {
  @override
  Widget build(BuildContext context) {
    return AllApps(
      appschildAspectRatio: 1.5,
      isClr: true,
      appsCrossAxisCount: 5,
    );
  }
}
