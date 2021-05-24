import 'package:app_calculadora/pages/equacao_segundo_grau/equacao_segundo_grau_page.dart';
import 'package:flutter/material.dart';
import 'package:app_calculadora/pages/calculadora/calculadora_page.dart';
import 'package:app_calculadora/pages/perimetro_circulo/perimetro_circulo_page.dart';
import 'package:app_calculadora/pages/teorema_pitagoras/teorema_pitagoras_page.dart';
import 'package:app_calculadora/shared/widgets/button_widget.dart';

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
              rotaPagina(context, CalculadoraPage());
            },
          ),
          ButtonWidget(
            margin: EdgeInsets.only(bottom: 10),
            labelBotao: "Teorema de Pitagoras",
            onCallback: () {
              rotaPagina(context, TeoremaPitagorasPage());
            },
          ),
          ButtonWidget(
            margin: EdgeInsets.only(bottom: 10),
            labelBotao: "Perimetro do Circulo",
            onCallback: () {
              rotaPagina(context, PerimetroCirculoPage());
            },
          ),
          ButtonWidget(
            margin: EdgeInsets.only(bottom: 10),
            labelBotao: "Equação de segundo grau",
            onCallback: () {
              rotaPagina(context, EquacaoSegundoGrauPage());
            },
          ),
        ],
      ),
    );
  }

  void rotaPagina(BuildContext context, dynamic pagina) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pagina,
      ),
    );
  }
}
