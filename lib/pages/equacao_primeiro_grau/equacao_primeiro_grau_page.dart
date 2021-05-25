import 'package:app_calculadora/shared/widgets/ajuda_widget.dart';
import 'package:app_calculadora/shared/widgets/button_form_container_widget.dart';
import 'package:app_calculadora/shared/widgets/input_widget.dart';
import 'package:app_calculadora/shared/widgets/resultado_widget.dart';
import 'package:app_calculadora/utils/calculadora.dart';
import 'package:app_calculadora/utils/calculadora_ajuda.dart';
import 'package:flutter/material.dart';

class EquacaoPrimeiroGrauPage extends StatefulWidget {
  @override
  _EquacaoPrimeiroGrauPageState createState() =>
      _EquacaoPrimeiroGrauPageState();
}

class _EquacaoPrimeiroGrauPageState extends State<EquacaoPrimeiroGrauPage> {
  final _formKey = GlobalKey<FormState>();
  Map<dynamic, dynamic> _formData = {};
  String _valor = '0';
  String _campoVazio = "Campo vazio";
  String _resultadoLabel = 'Resultado:';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Equação de segundo grau"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          children: [
            InputWidget(
              labelCampo: 'A',
              keyboardType: TextInputType.text,
              mensagemCampoErro: _campoVazio,
              onCallback: (value) {
                _formData["campo_a"] = value;
              },
            ),
            InputWidget(
              labelCampo: 'B',
              keyboardType: TextInputType.text,
              mensagemCampoErro: _campoVazio,
              onCallback: (value) {
                _formData["campo_b"] = value;
              },
            ),
            ResultadoWidget(
              resultadoLabel: _resultadoLabel,
              resultadoValor: '$_valor',
            ),
            ButtonFormContainerWidget(
              onCallbackSave: () {
                _calcular();
              },
              onCallbackReset: () {
                _resetForm();
              },
              onCallbackHelp: () {
                _ajuda(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  _calcular() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      num campoA = Calculadora.stringParaNum(_formData['campo_a']);
      num campoB = Calculadora.stringParaNum(_formData['campo_b']);

      String calculo = EquacacaoCalculadora.equacao1Grau(
        a: campoA,
        b: campoB,
      );

      setState(() {
        _valor = calculo;
      });
    }
  }

  _ajuda(BuildContext context) {
    List<String> mensagemAjuda = CalculadoraAjuda.equacaoPrimeiroGrauAjuda();
    showDialog(
      builder: (context) => Ajuda(
        conteudo: Column(
          children: [
            Text(mensagemAjuda[0]),
          ],
        ),
      ),
      context: context,
    );
  }

  _resetForm() {
    setState(() {
      _valor = '0';
    });
    _formKey.currentState!.reset();
  }
}
