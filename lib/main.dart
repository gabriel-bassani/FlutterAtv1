import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de pessoas",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Pode entrar!";

  void _changePeople(int delta) {
    setState(() {
      _pessoa += delta;
      if (_pessoa >= 20) {
        _mensagem = "Lotado, não pode entrar.";
        _pessoa = 20;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Restaurante está lotado."),
            duration: Duration(seconds: 2),
          ),
        );
      } else if (_pessoa < 0) {
        _pessoa = 0;
      } else {
        _mensagem = "Pode entrar!";
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _pessoa = 0;
      _mensagem = "Pode entrar!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador de Pessoas"),
        centerTitle: true,
        leading: Icon(Icons.restaurant_menu),
      ),
      body: Stack(
        children: <Widget>[
          Image.asset(
            "Imagens/restaurante.jpg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pessoas: $_pessoa",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: Text(
                      "+5",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(5);
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      "-5",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(-5);
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      "Reiniciar",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _resetCounter();
                    },
                  ),
                ],
              ),
              Text(
                _mensagem,
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
