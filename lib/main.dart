import 'package:flutter/material.dart';

import 'pages/homePage.dart';

void main() {
  runApp(const MyApp());
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Image(
          image: AssetImage("assets/images/bi/Bi1.png"),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
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
      ),
    );
  }
}
