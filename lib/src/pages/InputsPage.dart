import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _name = '', _email = '', _password = '';
  TextEditingController _input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Inputs'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
      body: _inputElements(context),
    );
  }

  Widget _inputElements(BuildContext context) => ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: <Widget>[
          _textField(),
          Divider(),
          _emailField(),
          Divider(),
          _passwordField(),
          Divider(),
          _dateField(context),
          Divider(),
          _dropField(),
          ElevatedButton(
              child: Text('Crear cuenta'),
              onPressed: () {
                final snackBar = SnackBar(content: Text('Los datos se guardaron :D!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),
          Divider(),
          _showData()
        ],
      );

  Widget _textField() => TextField(
        autofocus: true,
        textCapitalization: TextCapitalization.sentences, //teclado
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Nombre:',
            labelText: 'Nombre',
            helperText: 'Ingrese su nombre',
            suffixIcon: Icon(Icons.text_fields), //aparece a la derecha de field
            icon: Icon(Icons.account_circle),
            counter: Text('Caracteres: ${_name.length}')),
        onChanged: (text) {
          //evento
          setState(() {
            _name = text;
          });
        },
      );
  Widget _emailField() => TextField(
        textCapitalization: TextCapitalization.sentences, //teclado
        keyboardType: TextInputType.emailAddress, //tipo de entrada de email
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Correo:',
            labelText: 'Correo',
            helperText: 'Ingrese su Correo',
            suffixIcon: Icon(Icons.mail), //aparece a la derecha de field
            icon: Icon(Icons.mail),
            counter: Text('Caracteres: ${_email.length}')),
        onChanged: (text) {
          //evento
          setState(() {
            _email = text;
          });
        },
      );
  Widget _passwordField() => TextField(
        //textCapitalization: TextCapitalization.sentences, //teclado
        obscureText: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Contraseña:',
            labelText: 'Contraseña',
            helperText: 'Ingrese su contraseña',
            suffixIcon: Icon(Icons.security), //aparece a la derecha de field
            icon: Icon(Icons.lock),
            counter: Text('Caracteres: ${_password.length}')),
        onChanged: (text) {
          //evento
          setState(() {
            _password = text;
          });
        },
      );

  Widget _dateField(BuildContext context) => TextField(
        controller: _input,
        enableInteractiveSelection: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: 'Fecha de nacimiento',
            labelText: 'Fecha de nacimiento',
            helperText: 'Fecha de nacimiento',
            suffixIcon:
                Icon(Icons.calendar_today), //aparece a la derecha de field
            icon: Icon(Icons.date_range),
            counter: Text('Caracteres: ${_password.length}')),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          // _getDate(context);
          _getDate(context);
        },
      );

  Future<void> _getDate(BuildContext context) async {
    DateTime fecha = await showDatePicker(
        context: context,
        locale: Locale('es', 'MX'),
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2030)
        );
    if (fecha != null) {
      _input.text = fecha.toLocal().toUtc().toString();
    }
  }

  Widget _dropField() => Row(
        children: <Widget>[
          Icon(Icons.list),
          SizedBox(
            width: 30.0,
          ),
          Expanded(
              child: DropdownButton(
            items: _opciones(),
            value: _civil,
            onChanged: (option) {
              setState(() {
                _civil = option;
              });
            },
          ))
        ],
      );

  List<DropdownMenuItem<String>> _opciones() {
    List<DropdownMenuItem<String>> estados = [];
    _civiles.forEach((element) {
      estados.add(DropdownMenuItem(child: Text(element), value: element));
    });
    return estados;
  }

  Widget _showData() => ListTile(
        title: Text('Name: $_name\nCorreo: $_email\nPassword: $_password\nEstado Civil: $_civil'),
      );
  String _civil = 'Soltero(a)';
  List<String> _civiles = [
    'Soltero(a)',
    'Casado(a)',
    'Viudo(a)',
    'Unión Libre',
    'Es Complicado'
  ];
}
