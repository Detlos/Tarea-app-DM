import 'package:flutter/material.dart';

class ListasScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listas-Scroll',
      home: Scaffold(
        appBar: AppBar(title: Text('Listas-Scroll')),
        body: BodyLayout(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  final videojuegos = [
    'Minecraft',
    'OSU',
    'Call of Duty',
    'GTA V',
    'FIFA 18',
    'Smite',
    'Mario Kart',
    'LOL',
    'God of War',
    'SIMS',
    'Luigi',
    'ARK',
    'Pac Mam',
    'Assassins Creed',
    'Fornite',
    'NBA',
    'Mario 64',
    'Plantas vs Zombis',
    'Metroid Prime',
    'Let of deat',
    'Hitman',
    'Horizon',
    'Club Pengui',
    'Halo',
    'DOOM',
    'Habbo'
  ];
  return ListView.builder(
    itemCount: videojuegos.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(videojuegos[index]),
      );
    },
  );
}
