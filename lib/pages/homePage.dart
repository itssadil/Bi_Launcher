import 'package:flutter/material.dart';

import 'subPage/appsArea.dart';
import 'subPage/headerArea.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible = true;
  bool _isVisible2 = true;
  bool _isVisible3 = false;
  IconData _isShow = Icons.arrow_circle_up_sharp;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
            visible: _isVisible,
            child: Stack(
              children: [
                HeaderArea(),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Visibility(
                      visible: _isVisible2,
                      child: ArrowButton(),
                    ),
                  ),
                ),
              ],
            )),
        Expanded(
          child: Stack(children: [
            Positioned(
              child: AppsArea(),
            ),
            Positioned(
              child: Visibility(
                visible: _isVisible3,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ArrowButton(),
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }

  Widget ArrowButton() {
    return CircleAvatar(
      backgroundColor: Colors.black54,
      foregroundColor: Colors.white,
      child: IconButton(
        icon: Icon(_isShow),
        onPressed: () {
          setState(() {
            _isVisible = !_isVisible;
            if (_isVisible == true) {
              _isShow = Icons.arrow_circle_up_sharp;
              _isVisible2 = true;
              _isVisible3 = false;
            } else {
              _isShow = Icons.arrow_circle_down_sharp;
              _isVisible2 = false;
              _isVisible3 = true;
            }
          });
        },
      ),
    );
  }
}
