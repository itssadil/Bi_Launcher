import 'package:flutter/material.dart';

class HeaderArea extends StatefulWidget {
  const HeaderArea({Key? key}) : super(key: key);

  @override
  State<HeaderArea> createState() => _HeaderAreaState();
}

class _HeaderAreaState extends State<HeaderArea> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            color: Colors.blue,
            height: size.height * 0.35,
            width: size.width * 0.6,
          ),
          Container(
            color: Colors.red,
            height: size.height * 0.35,
            width: size.width * 0.6,
          ),
          Container(
            color: Colors.black,
            height: size.height * 0.35,
            width: size.width * 0.6,
          ),
          Container(
            color: Colors.yellow,
            height: size.height * 0.35,
            width: size.width * 0.6,
          ),
        ],
      ),
    );
  }
}
