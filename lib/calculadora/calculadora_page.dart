import 'package:app_calculadora/shared/widgets/ajuda.dart';
import 'package:app_calculadora/shared/widgets/button_widget.dart';
import 'package:app_calculadora/shared/widgets/input_widget.dart';
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
  String _campoVazioMensagem = "Campo vazio";

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
              mensagemCampoErro: _campoVazioMensagem,
              onCallback: (value) {
                _formData["nome"] = value;
              },
            ),
            InputWidget(
              labelCampo: 'Campo A',
              keyboardType: TextInputType.text,
              mensagemCampoErro: _campoVazioMensagem,
              onCallback: (value) {
                _formData["campo_a"] = value;
              },
            ),
            InputWidget(
              labelCampo: 'Campo B',
              keyboardType: TextInputType.text,
              mensagemCampoErro: _campoVazioMensagem,
              onCallback: (value) {
                _formData["campo_b"] = value;
              },
            ),
            InputWidget(
              labelCampo: 'Campo C',
              keyboardType: TextInputType.text,
              mensagemCampoErro: _campoVazioMensagem,
              onCallback: (value) {
                _formData["campo_c"] = value;
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Resultado:',
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
      String nome = _formData['nome'];
      num campoA = num.parse(_formData['campo_a']);
      num campoB = num.parse(_formData['campo_b']);
      num campoC = num.parse(_formData['campo_c']);

      num resultado = (campoB * campoC) / campoA;
      String resultadoFormatado = resultado.toStringAsFixed(2);
      String resultadoArredondado = resultado.round().toString();

      setState(() {
        _valor =
            '$nome -> $campoB -> $resultadoFormatado -> $resultadoArredondado';
        campoNomeController.text = '';
        campoBController.text = '';
        // return _valor;
      });
    }
  }

  _ajuda(BuildContext context) {
    showDialog(
      builder: (context) => Ajuda(
        texto: '''
          A----B
          C----X
          X=(B*C)/A''',
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
