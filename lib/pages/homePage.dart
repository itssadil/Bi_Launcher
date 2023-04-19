import 'package:flutter/material.dart';

import 'subPage/appsArea.dart';
import 'subPage/headerArea.dart';
import 'subPage/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _handleRefresh() async {
    // Add the logic to reload the data or refresh the UI here
    setState(() {
      // Update your app's data here
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          RefreshIndicator(
            onRefresh: _handleRefresh,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeaderArea(),
                  AppsArea(),
                ],
              ),
            ),
          ),
          Sidebar(),
        ],
      ),
    );
  }
}
