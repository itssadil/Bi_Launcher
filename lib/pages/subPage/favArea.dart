import 'package:bi_launcher/providers/favProvider.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavArea extends StatelessWidget {
  late bool isShow;
  @override
  Widget build(BuildContext context) {
    return Consumer<FavMovieList>(
      builder: (context, favMovieList, child) {
        if (favMovieList.appPackageNames.length != 0) {
          isShow = true;
        } else {
          isShow = false;
        }
        return Visibility(
          visible: isShow,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.5,
              ),
              itemCount: favMovieList.appPackageNames.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: DeviceApps.getApp(
                      favMovieList.appPackageNames[index], true),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Application? app = snapshot.data;
                      if (app != null) {
                        return GridTile(
                          child: GestureDetector(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white12),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.memory(
                                    (app as ApplicationWithIcon).icon,
                                    width: 80,
                                  ),
                                  SizedBox(height: 2.0),
                                  Text(
                                    app.appName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () async {
                              await DeviceApps.openApp(app.packageName);
                            },
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SimpleDialog(
                                    title: Text("${app.appName}"),
                                    children: <Widget>[
                                      Consumer<FavMovieList>(
                                        builder:
                                            (context, favMovieList, child) {
                                          return SimpleDialogOption(
                                            onPressed: () {
                                              favMovieList.removeFavMovieList(
                                                  app.packageName);
                                              Navigator.of(context).pop();
                                            },
                                            child: Row(
                                              children: [
                                                Icon(Icons.heart_broken),
                                                SizedBox(width: 10),
                                                Text('Remove from ❤'),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      SimpleDialogOption(
                                        onPressed: () {
                                          DeviceApps.openAppSettings(
                                            app.packageName,
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
                                            app.packageName,
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
                          ),
                        );
                      }
                    }
                    return SizedBox.shrink();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
