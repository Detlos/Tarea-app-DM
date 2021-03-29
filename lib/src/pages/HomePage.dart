import 'dart:core';
import 'package:flutter/material.dart';
import 'package:listview/src/provider/jsonprovider.dart';
import 'package:listview/src/utils/StringIcon.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() => Scaffold(
        appBar: AppBar(
          title: Text('Inicio'),
        ),
        body: _lista(),
      );

  Widget _lista() {
    return FutureBuilder(
      future: jsonprovider.reload(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _rows(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _rows(List<dynamic> data, BuildContext context) {
    final List<Widget> row = [];
    data.forEach((element) {
      final tmp = ListTile(
        title: Text(element['texto']),
        subtitle: Text('Subtítulo ${element['ruta']}'),
        leading: getIconFromJson(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      row.add(tmp);
      row.add(Divider());
    });
    return row;
  }
}
