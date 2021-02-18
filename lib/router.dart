import 'package:cabbitCatoon/widget/authen.dart';
import 'package:cabbitCatoon/widget/my_service.dart';
import 'package:cabbitCatoon/widget/register.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/authen': (BuildContext context) => Authen(),
  '/register': (BuildContext context) => Register(),
  '/myService': (BuildContext context) => MyService(),
};
