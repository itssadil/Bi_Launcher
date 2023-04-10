import 'dart:math';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AppsArea extends StatefulWidget {
  const AppsArea({Key? key}) : super(key: key);

  @override
  State<AppsArea> createState() => _AppsAreaState();
}

class _AppsAreaState extends State<AppsArea> {
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
            crossAxisCount: 5,
            childAspectRatio: 1.5,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(allApps!.length, (index) {
              int cindex = random.nextInt(colors.length);
              Color tempcol = colors[cindex];
              return InkWell(
                onTap: () {
                  DeviceApps.openApp(allApps[index].packageName);
                },
                child: Container(
                  // color: Color(0xff303030),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: tempcol,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
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
        } else {
          return Container(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              childAspectRatio: 1.5,
              physics: NeverScrollableScrollPhysics(),
              children: [for (int i = 0; i < 10; i++) AppLoading()],
            ),
          );
        }
      },
    );
  }

  AppLoading() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Color(0xFF18122B),
        ),
        child: RiveAnimation.asset(
          "assets/rive/app_loading.riv",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
