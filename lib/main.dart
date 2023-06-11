// import 'package:bi_launcher/pages/homePage.dart';
import 'package:bi_launcher/pages/homePage.dart';
import 'package:bi_launcher/pages/searchPage.dart';
import 'package:bi_launcher/providers/favProvider.dart';
import 'package:bi_launcher/providers/sectionControls.dart';
// import 'package:bi_launcher/widgets/allApps.dart';
import 'package:bi_launcher/widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HeaderMoviesCtrl()),
        ChangeNotifierProvider(create: (context) => FavCtrl()),
        ChangeNotifierProvider(create: (context) => SiteCtrl()),
        ChangeNotifierProvider(create: (context) => SidebarCtrl()),
        ChangeNotifierProvider(create: (context) => FavMovieList()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: mainSfull(),
    );
  }
}

class mainSfull extends StatefulWidget {
  const mainSfull({Key? key}) : super(key: key);

  @override
  State<mainSfull> createState() => _mainSfullState();
}

class _mainSfullState extends State<mainSfull> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: Drawer(
        child: MyDrawer(),
      ),
      appBar: AppBar(
        leading: Image(
          image: AssetImage("assets/images/bi/Bi1.png"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchPage(),
              ));
            },
            icon: Icon(Icons.search),
          ),
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(Icons.menu),
              );
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF060131),
              Color(0xFF18122B),
              Color(0xFF18122B),
              Color(0xFFD21312),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: HomePage(),
        // child: SearchPage(),
      ),
    );
  }
}
