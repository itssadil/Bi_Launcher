import 'dart:math';

import 'package:bi_launcher/providers/favProvider.dart';
import 'package:bi_launcher/widgets/appLoading.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllApps extends StatelessWidget {
  final int appsCrossAxisCount;
  final double appschildAspectRatio;
  final double appIconWidth;
  final bool isClr;

  AllApps({
    Key? key,
    required this.appsCrossAxisCount,
    required this.appschildAspectRatio,
    required this.appIconWidth,
    required this.isClr,
  }) : super(key: key);

  List<Color> colors = [
    Colors.redAccent,
    Colors.purple,
    Colors.deepOrange,
    Colors.blue,
    Colors.indigo,
  ];
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DeviceApps.getInstalledApplications(
        includeSystemApps: true,
        onlyAppsWithLaunchIntent: true,
        includeAppIcons: true,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // if (1 == 0) {
          List<Application>? allApps = snapshot.data;
          return GridView.count(
            shrinkWrap: true,
            crossAxisCount: appsCrossAxisCount,
            childAspectRatio: appschildAspectRatio,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(allApps!.length, (index) {
              int cindex = random.nextInt(colors.length);
              Color tempcol = colors[cindex];
              return InkWell(
                onTap: () {
                  DeviceApps.openApp(allApps[index].packageName);
                },
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text("${allApps[index].appName}"),
                        children: <Widget>[
                          Consumer<FavMovieList>(
                            builder: (context, favMovieList, child) {
                              return SimpleDialogOption(
                                onPressed: () {
                                  favMovieList.addFavMovieList(
                                    allApps[index].packageName,
                                    allApps[index].appName,
                                    context,
                                  );
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.favorite),
                                    SizedBox(width: 10),
                                    Text('Favorite'),
                                  ],
                                ),
                              );
                            },
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              DeviceApps.openAppSettings(
                                allApps[index].packageName,
                              );
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: [
                                Icon(Icons.info),
                                SizedBox(width: 10),
                                Text('App Info'),
                              ],
                            ),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              DeviceApps.uninstallApp(
                                allApps[index].packageName,
                              );
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: [
                                Icon(Icons.dangerous),
                                SizedBox(width: 10),
                                Text('Uninstall'),
                              ],
                            ),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Row(
                              children: [
                                Icon(Icons.backspace_outlined),
                                SizedBox(width: 10),
                                Text('Close'),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  // color: Color(0xff303030),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isClr ? tempcol : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.memory(
                            (allApps[index] as ApplicationWithIcon).icon,
                            width: appIconWidth,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "${allApps[index].appName}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        } else {
          return Container(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: appsCrossAxisCount,
              childAspectRatio: appschildAspectRatio,
              physics: NeverScrollableScrollPhysics(),
              children: [
                for (int i = 0; i < appsCrossAxisCount * 2; i++) AppLoading()
              ],
            ),
          );
        }
      },
    );
  }
}
