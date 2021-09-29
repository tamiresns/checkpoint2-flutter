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

  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();
  String resultado = "";
  void _calcular() {
    setState(() {
      double precoAlcool = double.parse(alcoolController.text);
      double precoGasolina = double.parse(gasolinaController.text);

      double valor = precoAlcool / precoGasolina
      resultado = "Gasolina mais vantajosa" 

      if(valor < 0.7) {
        resultado = "Alcool mais vantajoso";
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
        _inputAlcool(),
        _inputGasolina(),
        _button(),
        _resultado()
      ]
    )
  );
}
_image() {
    return Center(
      child: Image.network(
        'https://icons-for-free.com/iconfiles/png/512/fuel+pump+icon-1320136427946720947.png',
        height: 150,
        width: 150,
      ),
    );

}
_inputAlcool() {
  return TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: "Preço Alcool",
      labelStyle: TextStyle(color: Colors.blue)
    ),
    style: TextStyle(color: Colors.blue, fontSize: 25),
    textAlign: TextAlign.center,
    controller: alcoolController,
  );

}
_inputGasolina() {
  return TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: "Preço Gasolina",
      labelStyle: TextStyle(color: Colors.blue)
    ),
    style: TextStyle(color: Colors.blue, fontSize: 25),
    textAlign: TextAlign.center,
    controller: gasolinaController,
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