import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Página de alertas'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        body: _alerta(context),
      );

  Widget _alerta(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _showMyDialog(context);
        },
        child: Text('Alerta'),
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(), textStyle: TextStyle(fontSize: 40)),
      ),
    );
  }

  void _showDialogAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text('Alerta'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[FlutterLogo(), Text('Alerta')],
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      // si acepta, que regrese a la ventana anterior
                      Navigator.of(context).pop();
                    },
                    child: Text('Aceptar')),
              ],
            ));
  }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Esto es un simulaco de alerta'),
                Text('Todo esta bien tranquilos'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
