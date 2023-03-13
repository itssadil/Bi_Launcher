import 'dart:math';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class AppsArea extends StatefulWidget {
  const AppsArea({Key? key}) : super(key: key);

  @override
  State<AppsArea> createState() => _AppsAreaState();
}

class _AppsAreaState extends State<AppsArea> {
  BouncingScrollPhysics _bouncingScrollPhysics = BouncingScrollPhysics();
  List<Color> colors = [
    Colors.red,
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
          List<Application>? allApps = snapshot.data;
          return GridView.count(
            crossAxisCount: 5,
            childAspectRatio: 1.5,
            physics: _bouncingScrollPhysics,
            children: List.generate(allApps!.length, (index) {
              int cindex = random.nextInt(colors.length);
              Color tempcol = colors[cindex];
              return GestureDetector(
                onTap: () {
                  DeviceApps.openApp(allApps[index].packageName);
                },
                child: Container(
                  color: Color(0xff303030),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: tempcol,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 17,
                          ),
                          Image.memory(
                            (allApps[index] as ApplicationWithIcon).icon,
                            width: 50,
                          ),
                          SizedBox(
                            height: 10,
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
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
