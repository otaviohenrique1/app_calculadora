import 'package:app_calculadora/shared/widgets/ajuda_widget.dart';
import 'package:app_calculadora/shared/widgets/button_form_container_widget.dart';
import 'package:app_calculadora/shared/widgets/input_widget.dart';
import 'package:app_calculadora/shared/widgets/resultado_widget.dart';
import 'package:app_calculadora/utils/calculadora.dart';
import 'package:app_calculadora/utils/calculadora_ajuda.dart';
import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final _formKey = GlobalKey<FormState>();
  Map<dynamic, dynamic> _formData = {};
  String _valor = '0';
  final campoNomeController = TextEditingController();
  final campoBController = TextEditingController();
  String _campoVazio = "Campo vazio";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
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
              labelCampo: 'Nome',
              keyboardType: TextInputType.text,
              mensagemCampoErro: _campoVazio,
              onCallback: (value) {
                _formData["nome"] = value;
              },
            ),
            InputWidget(
              labelCampo: 'Campo A',
              keyboardType: TextInputType.text,
              mensagemCampoErro: _campoVazio,
              onCallback: (value) {
                _formData["campo_a"] = value;
              },
            ),
            InputWidget(
              labelCampo: 'Campo B',
              keyboardType: TextInputType.text,
              mensagemCampoErro: _campoVazio,
              onCallback: (value) {
                _formData["campo_b"] = value;
              },
            ),
            InputWidget(
              labelCampo: 'Campo C',
              keyboardType: TextInputType.text,
              mensagemCampoErro: _campoVazio,
              onCallback: (value) {
                _formData["campo_c"] = value;
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
      String nome = _formData['nome'];
      num campoA = Calculadora.stringParaNum(_formData['campo_a']);
      num campoB = Calculadora.stringParaNum(_formData['campo_b']);
      num campoC = Calculadora.stringParaNum(_formData['campo_c']);

      num resultado = Calculadora.calculaMedida(
        campoA: campoA,
        campoB: campoB,
        campoC: campoC,
      );

      String resultadoFormatado = Calculadora.formataCalculoEmString(
        valor: campoB,
        resultado: resultado,
      );

      setState(() {
        // _valor =
        //     '$nome -> $campoB -> $resultadoFormatado -> $resultadoArredondado';
        _valor = '$nome -> $resultadoFormatado';
        campoNomeController.text = '';
        campoBController.text = '';
      });
    }
  }

  _ajuda(BuildContext context) {
    List<String> mensagemAjuda = CalculadoraAjuda.calculadoraAjuda();
    showDialog(
      builder: (context) => Ajuda(
        conteudo: Column(
          children: [
            Text(mensagemAjuda[0]),
            Text(mensagemAjuda[1]),
            Text(mensagemAjuda[2]),
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
