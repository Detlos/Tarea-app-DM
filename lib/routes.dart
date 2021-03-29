import 'package:flutter/material.dart';
import 'package:listview/src/pages/AlertPage.dart';
import 'package:listview/src/pages/AnimatedPage.dart';
import 'package:listview/src/pages/AvatarPage.dart';
import 'package:listview/src/pages/CameraPage.dart';
import 'package:listview/src/pages/CardPage.dart';
import 'package:listview/src/pages/InputsPage.dart';
import 'package:listview/src/pages/HomePage.dart';
import 'package:listview/src/pages/SliderChecks.dart';
import 'package:listview/src/pages/ListasScroll.dart';
import 'package:listview/src/pages/VideoPage.dart';

Map<String, WidgetBuilder> routes(BuildContext context) {
  Map<String, WidgetBuilder> rutas = {
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedPage(),
    'inputs': (BuildContext context) => InputsPage(),
    'slider': (BuildContext context) => SliderChecksPage(),
    'list': (BuildContext context) => ListasScroll(),
    'camera': (BuildContext context) => CameraApp(),
    'videocam': (BuildContext context) => YoutubePlayerDemoApp(),
  };
  return rutas;
}
