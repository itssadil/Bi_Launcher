import 'package:bi_launcher/providers/sectionControls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Card(
            color: Colors.blue,
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
              title: Text("Control Center"),
            ),
          ),
          Card(
            child: ExpansionTile(
              leading: Icon(Icons.display_settings_outlined),
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
          ),
          Card(
            child: ExpansionTile(
              leading: Icon(Icons.tv),
              title: Text('Bi Launcher'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'BI Launcher is an Android TV launcher that is designed to provide users with a user-friendly interface and quick access to their favorite content, including movies, shows, apps, and games. This launcher is designed to be easy to use and intuitive, making it ideal for users who want to quickly and easily find the content they want to watch or play.\n\n'
                    'BI Launcher features a clean and modern interface that is easy to navigate. The launcher is organized into different categories, making it easy to find the content you are looking for. For example, the launcher has a section for movies, a section for TV shows, a section for apps, and a section for games. Each section is further subdivided into different categories, such as "popular movies" or "new releases."\n\n'
                    'One of the key features of BI Launcher is its quick access feature. This feature allows users to quickly access their favorite content by creating shortcuts on the launcher\'s home screen. For example, if you frequently watch a particular TV show, you can create a shortcut for that show on the home screen. This allows you to quickly access the show with just a few clicks.\n\n'
                    'Another great feature of BI Launcher is its customization options. Users can customize the launcher\'s home screen by adding or removing shortcuts, changing the background image, and adjusting the layout. This allows users to tailor the launcher to their preferences and make it their own.\n\n'
                    'Overall, BI Launcher is a great option for anyone looking for an easy-to-use Android TV launcher that provides quick access to their favorite content. With its user-friendly interface and customization options, it is sure to be a hit with users who want a simple and intuitive way to access their favorite shows, movies, apps, and games.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('About Bi'),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: "Bi Launcher",
                  applicationVersion: "1.0.0",
                  applicationIcon: Image.asset(
                    "assets/images/bi/Bi1.png",
                    width: 100,
                    height: 100,
                  ),
                  applicationLegalese: "Copyright © 2023 Bi Launcher",
                  children: [
                    Text("User-friendly interface for quick content access."),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
