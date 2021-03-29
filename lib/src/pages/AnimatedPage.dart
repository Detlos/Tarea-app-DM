import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  AnimatedPage({Key key}) : super(key: key);

  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Animada'),
      ),
      body: _animacion(),
      floatingActionButton: FloatingActionButton(
        onPressed: _onclick,
        child: Icon(Icons.play_arrow)
      ),
      
    );
  }

  Widget _animacion() {
    return Center(
        child: AnimatedContainer(
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
      width: _width,
      height: _height,
      decoration: BoxDecoration(color: _color, borderRadius: _border),
    ));
  }

  Future<void> _onclick() async {
    final snackBar = SnackBar(
      content: Text('Animacion en proceso..'),
      duration: Duration(seconds: 2),
    );
    final random = Random();
    setState(() {
      _height = random.nextInt(300).toDouble();
      _width = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 100);
      _border = BorderRadius.circular(random.nextInt(255).toDouble());
    });
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  double _width = 50.0, _height = 50.0;
  Color _color = Colors.blue;
  BorderRadiusGeometry _border = BorderRadius.circular(10.0);
}
