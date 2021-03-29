import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Página de cartas'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        body: _listCards(context),
      );

  Widget _listCards(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(5.0),
      children: <Widget>[
        _cardExample(context),
        SizedBox(
          height: 5.0,
        ),
        _imageCard(context),
        SizedBox(
          height: 5.0,
        ),
        _cardExample(context)
      ],
    );
  }

  Widget _imageCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          FadeInImage(
            height: 250,
            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 100),
            image: NetworkImage('https://i.pinimg.com/564x/78/40/56/78405607700763c8bf00f565168bc89d.jpg'), 
            placeholder: AssetImage('assets/cargando.gif')
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Ok'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardOne(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Tarjeta 1'),
            leading: Icon(Icons.ac_unit_rounded),
            subtitle: Text('Tarjeta de presentación'),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

  Widget _cardExample(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            title: Text('The Weeknd'),
            subtitle: Text('Telepatìa'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Like'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Dont like'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
