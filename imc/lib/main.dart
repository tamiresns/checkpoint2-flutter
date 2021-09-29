import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resultado = "";
  void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);

      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        resultado = "Abaixo do Peso";
      } else if (imc >= 18.6 && imc < 24.9) {
        resultado = "Peso Ideal";
      } else if (imc >= 24.9 && imc < 29.9) {
        resultado = "Sobrepeso";
      } else if (imc >= 29.9 && imc < 34.9) {
        resultado = "Obesidade Grau I";
      } else if (imc >= 34.9 && imc < 39.9) {
        resultado = "Obesidade Grau II";
      } else {
        resultado = "Obesidade Grau III";
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Alcool vs Gasolina",
      home: Scaffold(
        appBar: _appbar(),
        body: _body()
      )
    );
  }
_appbar() {
  return AppBar(
    title: Text("Alcool vs Gasolina"),
    backgroundColor: Colors.blue,
    centerTitle: true,
  );
}
_body() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _image(),
        _inputPeso(),
        _inputAltura(),
        _button(),
        _resultado()
      ]
    )
  );
}
_image() {
    return Center(
      child: Image.network(
        'https://pt.calcuworld.com/wp-content/uploads/sites/6/2019/07/imc-.png',
        height: 150,
        width: 150,
      ),
    );

}
_inputPeso() {
  return TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: "Peso",
      labelStyle: TextStyle(color: Colors.blue)
    ),
    style: TextStyle(color: Colors.blue, fontSize: 25),
    textAlign: TextAlign.center,
    controller: pesoController,
  );

}
_inputAltura() {
  return TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: "Altura",
      labelStyle: TextStyle(color: Colors.blue)
    ),
    style: TextStyle(color: Colors.blue, fontSize: 25),
    textAlign: TextAlign.center,
    controller: alturaController,
  );

}
_button() {
  return RaisedButton(
    onPressed: _calcular,
    
    child: Text("Calcular")
  );
}
_resultado() {
  return Text("$resultado");
}
}