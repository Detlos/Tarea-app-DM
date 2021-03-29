import 'package:flutter/material.dart';

final _iconos = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  "donut_large": Icons.donut_large,
  "input": Icons.input,
  "tune": Icons.tune,
  "list": Icons.list,
  "videocam": Icons.videocam,
  "camera": Icons.camera
};

Icon getIconFromJson(String iconName) {
  return Icon(
    _iconos[iconName],
  );
}
