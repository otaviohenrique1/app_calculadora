import 'package:app_calculadora/shared/widgets/ajuda.dart';
import 'package:app_calculadora/shared/widgets/button_widget.dart';
import 'package:app_calculadora/shared/widgets/input_widget.dart';
import 'package:app_calculadora/utils/calculadora.dart';
import 'package:flutter/material.dart';

class TeoremaPitagorasPage extends StatefulWidget {
  @override
  _TeoremaPitagorasPageState createState() => _TeoremaPitagorasPageState();
}

class _TeoremaPitagorasPageState extends State<TeoremaPitagorasPage> {
  final _formKey = GlobalKey<FormState>();
  Map<dynamic, dynamic> _formData = {};
  String _valor = '0';
  String _campoVazio = "Campo vazio";
  String _resultadoLabel = 'Resultado:';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teorema de Pitagoras"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          children: [
            // Image.asset('assets/triangulo_retangulo.png'),
            InputWidget(
              labelCampo: 'Cateto 1',
              keyboardType: TextInputType.text,
              mensagemCampoErro: _campoVazio,
              onCallback: (value) {
                _formData["cateto_1"] = value;
              },
            ),
            InputWidget(
              labelCampo: 'Cateto 2',
              keyboardType: TextInputType.text,
              mensagemCampoErro: _campoVazio,
              onCallback: (value) {
                _formData["cateto_2"] = value;
              },
            ),
            InputWidget(
              labelCampo: 'Hipotenusa',
              keyboardType: TextInputType.text,
              mensagemCampoErro: _campoVazio,
              onCallback: (value) {
                _formData["hipotenusa"] = value;
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _resultadoLabel,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '$_valor',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonWidget(
                    margin: EdgeInsets.only(left: 10),
                    labelBotao: 'Calcular',
                    onCallback: () {
                      _calcular();
                    },
                  ),
                  ButtonWidget(
                    margin: EdgeInsets.only(left: 10),
                    labelBotao: 'Limpar',
                    onCallback: () {
                      _resetForm();
                    },
                  ),
                  ButtonWidget(
                    margin: EdgeInsets.only(left: 10),
                    labelBotao: 'Ajuda',
                    onCallback: () {
                      _ajuda(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _calcular() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String nomeCampo = '';
      num cateto1 = num.parse(_formData['cateto_1']);
      num cateto2 = num.parse(_formData['cateto_2']);
      num hipotenusa = num.parse(_formData['hipotenusa']);

      dynamic resultado;
      dynamic resultadoFormatado;
      dynamic resultadoArredondado;

      List<dynamic> calculo = Calculadora.teoremaDePitagoras2(
          cateto1: cateto1, cateto2: cateto2, hipotenusa: hipotenusa);

      setState(() {
        nomeCampo = calculo[0];
        resultado = calculo[1];
        resultadoFormatado = resultado.toStringAsFixed(2);
        resultadoArredondado = resultado.round().toString();

        _resultadoLabel = 'Resultado: $nomeCampo';
        _valor = '$resultado -> $resultadoFormatado -> $resultadoArredondado';
        // return _valor;
      });
    }
  }

  _ajuda(BuildContext context) {
    List<String> mensagemAjuda = Calculadora.teoremaDePitagorasAjuda();
    showDialog(
      builder: (context) => Ajuda(
        conteudo: Column(
          children: [
            Text(mensagemAjuda[0]),
            Text(mensagemAjuda[1]),
            Text(mensagemAjuda[2]),
            Text(mensagemAjuda[3]),
          ],
        ),
      ),
      context: context,
    );
  }

  _resetForm() {
    setState(() {
      _valor = "0";
      _resultadoLabel = 'Resultado:';
    });
    _formKey.currentState!.reset();
  }
}
