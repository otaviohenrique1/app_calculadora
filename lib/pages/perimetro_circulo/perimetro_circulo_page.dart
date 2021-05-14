import 'package:app_calculadora/shared/widgets/ajuda_widget.dart';
import 'package:app_calculadora/shared/widgets/button_form_container_widget.dart';
import 'package:app_calculadora/shared/widgets/input_widget.dart';
import 'package:app_calculadora/shared/widgets/resultado_widget.dart';
import 'package:app_calculadora/utils/calculadora.dart';
import 'package:flutter/material.dart';

class PerimetroCirculoPage extends StatefulWidget {
  @override
  _PerimetroCirculoPageState createState() => _PerimetroCirculoPageState();
}

class _PerimetroCirculoPageState extends State<PerimetroCirculoPage> {
  final _formKey = GlobalKey<FormState>();
  Map<dynamic, dynamic> _formData = {};
  final campoValorController = TextEditingController();
  String _valor = '0';
  String _campoVazio = "Campo vazio";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perimetro do Circulo"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          children: [
            InputWidget(
              labelCampo: 'Valor do raio do circulo',
              keyboardType: TextInputType.text,
              mensagemCampoErro: _campoVazio,
              onCallback: (value) {
                _formData["campo_valor"] = value;
              },
            ),
            ResultadoWidget(
              resultadoLabel: 'Resultado:',
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
      num campoValorRaio = Calculadora.stringParaNum(_formData['campo_valor']);
      // num resultado = 2 * pi * campoValorRaio;
      num resultado = Calculadora.perimetroCirculo(campoValorRaio);
      // String resultadoFormatado = resultado.toStringAsFixed(2);
      // String resultadoArredondado = resultado.round().toString();

      String resultadoFormatado = Calculadora.formataCalculoEmString(
        valor: campoValorRaio,
        resultado: resultado,
      );

      setState(() {
        _valor = resultadoFormatado;
        // _valor =
        //     '$campoValorRaio -> $resultadoFormatado -> $resultadoArredondado';
        campoValorController.text = '';
        // return _valor;
      });
    }
  }

  _ajuda(BuildContext context) {
    List<String> mensagemAjuda = CalculadoraAjuda.perimeroCirculoAjuda();
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
    });
    _formKey.currentState!.reset();
  }
}
