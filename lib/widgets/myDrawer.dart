import 'package:bi_launcher/providers/sectionControls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        ExpansionTile(
          title: Text('Section Control'),
          children: <Widget>[
            Consumer<HeaderMoviesCtrl>(
              builder: (context, isHeaderMovie, child) {
                return SwitchListTile(
                  value: isHeaderMovie.isHeaderMovie,
                  activeColor: Colors.blue,
                  onChanged: (value) => isHeaderMovie.cngHeaderMovie(),
                  title: Text("Header Movies"),
                );
              },
            ),
            Consumer<SidebarCtrl>(
              builder: (context, isSidebar, child) {
                return SwitchListTile(
                  value: isSidebar.isSidebar,
                  activeColor: Colors.blue,
                  onChanged: (value) => isSidebar.cngSidebarCtrl(),
                  title: Text("Sidebar apps"),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
