import 'package:flutter/material.dart';
import 'package:perez/route_generator.dart';

void main() => runApp(MyRoblesApp());

class MyRoblesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruteo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
class PageOne extends StatelessWidget {
  String _params = "hola desde p1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
 
  PageOne({
    Key key,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Primer pantalla Perez'),
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text(
              "Siguiente pagina",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.cyan,
            onPressed: () {
              _openSecondPage(context);
            },
          ),
        ),
      ),
    );
  }
  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;
    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Nombre ingresado: $_datoRetornadoDeSecondPage",
        ),
      ),
    );
  }
}
