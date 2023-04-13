import 'package:bi_launcher/providers/sectionControls.dart';
import 'package:bi_launcher/widgets/allApps.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SidebarCtrl>(
      builder: (context, isSidebar, child) {
        return Visibility(
          visible: isSidebar.isSidebar,
          child: Positioned(
            left: -5,
            top: MediaQuery.of(context).size.height * 0.35,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(50, 55),
                backgroundColor: Colors.black45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Icon(Icons.apps),
              onPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  context: context,
                  builder: (context) {
                    return Stack(
                      children: [
                        SingleChildScrollView(
                          padding: EdgeInsets.only(top: 55),
                          child: AllApps(
                            appschildAspectRatio: 1.0,
                            appIconWidth: 50,
                            isClr: false,
                            appsCrossAxisCount: 8,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.indigo,
                            radius: 25,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
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
