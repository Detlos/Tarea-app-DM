import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _JsonProvider {
  List<dynamic> datos; 

  _JsonProvider() {
    datos = [];
    // load();
  }

  void load() {
    rootBundle.loadString('data/Ejemplo.json').then((data) {
      // print(data);
      Map jsonmap = jsonDecode(data); 
      print(jsonmap['rutas']);
      datos = jsonmap['rutas'];
    });
  }

  Future<List<dynamic>> reload() async {
    final raw = await rootBundle.loadString('data/Ejemplo.json');
    Map jsonmap = jsonDecode(raw); 
    print(jsonmap['rutas']);
    datos = jsonmap['rutas'];
    return datos;
  }
}

final jsonprovider = _JsonProvider();
