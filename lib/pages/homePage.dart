import 'package:bi_launcher/providers/sectionControls.dart';
import 'package:bi_launcher/widgets/sectionTitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'subPage/appsArea.dart';
import 'subPage/favArea.dart';
import 'subPage/headerArea.dart';
import 'subPage/moviesSite.dart';
import 'subPage/sidebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _handleRefresh() async {
    // Add the logic to reload the data or refresh the UI here
    setState(() {});
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
                  /*===========================================================
                                         HEADER AREA
                  ===========================================================*/

                  HeaderArea(),

                  /*===========================================================
                                           MOVIE SITE
                  ===========================================================*/

                  MoviesSite(),

                  /*===========================================================
                                       FAV AREA & SECTION TITLE
                  ===========================================================*/

                  Consumer<FavCtrl>(
                    builder: (context, isFav, child) {
                      return Visibility(
                        visible: isFav.isFav,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SectionTitle(title: "Favorite"),
                            FavArea(),
                            SectionTitle(title: "Applications"),
                          ],
                        ),
                      );
                    },
                  ),

                  /*===========================================================
                                        APPLICATION AREA
                  ===========================================================*/

                  AppsArea(),
                ],
              ),
            ),
          ),

          /*===========================================================
                                         SIDEBAR AREA
          ===========================================================*/

          Sidebar(),
        ],
      ),
    );
  }
}
