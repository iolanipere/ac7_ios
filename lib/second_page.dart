import 'package:flutter/material.dart';
 
class SecondPage extends StatelessWidget {
  final String texto;
  TextEditingController _textController = TextEditingController();
 
  SecondPage({Key key, this.texto}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda pantalla Perez"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24.0),
              child: TextField(
                controller: _textController,
                maxLength: 40,
                decoration: InputDecoration(
                  labelText: "Ingrese nombre",
                  hintText: "Nombre",
                ),
              ),
            ),
            MaterialButton(
              child: Text(
                "Regresar",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.cyan,
              onPressed: () {
                Navigator.of(context).pop(_textController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
