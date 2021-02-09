import 'package:cabbitCatoon/utillity/my_style.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  Authen({Key key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Titless'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildLogo(),
            MyStyle().TitleH1('Cabbit Cartoon'),
          ],
        ),
      ),
    );
  }

  Container buildLogo() {
    return Container(
      width: screen * 0.4,
      child: MyStyle().ShowLogo(),
    );
  }
}
