import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

Widget WaitingForInfo({required Size size}) {
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: size.height * 0.35,
        width: size.width * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.2),
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
      );
    },
    itemCount: 5,
    // physics: NeverScrollableScrollPhysics(),
  );
}
