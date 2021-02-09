import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Color(0x000081);
  Color primaryColor = Color(0x4825b2);
  Color lightColor = Color(0x7e52e5);

  Widget ShowLogo() => Image.asset('images/logo.png');
  Widget TitleH1(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          // color: darkColor,
        ),
      );
  MyStyle();
}
