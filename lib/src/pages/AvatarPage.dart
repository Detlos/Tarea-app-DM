import 'package:flutter/material.dart';
class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Pagina de avatar'),
          actions: <Widget>[
            Image.asset('assets/avatar.png'),
          ],
        ),
        body: Image.asset('assets/avatar.png'),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      );
}