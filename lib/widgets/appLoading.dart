import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
