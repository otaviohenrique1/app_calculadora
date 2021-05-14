import 'package:app_calculadora/shared/widgets/ajuda_widget.dart';
import 'package:app_calculadora/shared/widgets/button_form_container_widget.dart';
import 'package:app_calculadora/shared/widgets/input_widget.dart';
import 'package:app_calculadora/shared/widgets/resultado_widget.dart';
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
      String nomeCampo = '';

      num cateto1 = Calculadora.stringParaNum(_formData['cateto_1']);
      num cateto2 = Calculadora.stringParaNum(_formData['cateto_2']);
      num hipotenusa = Calculadora.stringParaNum(_formData['hipotenusa']);

      dynamic resultado;
      dynamic resultadoFormatado;
      dynamic resultadoArredondado;

      List<dynamic> calculo = TeoremaDePitagoras.teoremaDePitagoras2(
        cateto1: cateto1,
        cateto2: cateto2,
        hipotenusa: hipotenusa,
      );

      setState(() {
        nomeCampo = calculo[0];
        resultado = calculo[1];
        resultadoFormatado = resultado.toStringAsFixed(2);
        resultadoArredondado = resultado.round().toString();

        _resultadoLabel = 'Resultado: $nomeCampo';
        _valor = '$resultado -> $resultadoFormatado -> $resultadoArredondado';
      });
    }
  }

  _ajuda(BuildContext context) {
    List<String> mensagemAjuda = CalculadoraAjuda.teoremaDePitagorasAjuda();
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
