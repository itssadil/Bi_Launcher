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
      appBar: AppBar(
        leading: Image(
          image: AssetImage("assets/images/bi/Bi1.png"),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
          Visibility(
            visible: false,
            child: CircleAvatar(
              backgroundColor: Colors.purple,
              foregroundColor: Colors.black,
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_circle_down_sharp)),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: HomePage(),
    );
  }
}
