import 'package:app_calculadora/calculadora/calculadora_page.dart';
import 'package:app_calculadora/perimetro_circulo/perimetro_circulo_page.dart';
import 'package:app_calculadora/shared/widgets/button_widget.dart';
import 'package:app_calculadora/teorema_pitagoras/teorema_pitagoras_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ButtonWidget(
            margin: EdgeInsets.only(bottom: 10),
            labelBotao: "Calculadora",
            onCallback: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CalculadoraPage(),
                ),
              );
            },
          ),
          ButtonWidget(
            margin: EdgeInsets.only(bottom: 10),
            labelBotao: "Teorema de Pitagoras",
            onCallback: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TeoremaPitagorasPage(),
                ),
              );
            },
          ),
          ButtonWidget(
            margin: EdgeInsets.only(bottom: 10),
            labelBotao: "Perimetro do Circulo",
            onCallback: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PerimetroCirculoPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
