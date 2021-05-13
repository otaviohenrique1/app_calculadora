import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget {
  final String resultadoLabel;
  final String resultadoValor;

  const ResultadoWidget({
    Key? key,
    required this.resultadoLabel,
    required this.resultadoValor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            resultadoLabel,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                resultadoValor,
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
