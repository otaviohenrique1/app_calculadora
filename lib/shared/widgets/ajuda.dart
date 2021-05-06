import 'package:flutter/material.dart';

class Ajuda extends StatelessWidget {
  final String texto;
  Ajuda({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
      title: Text('Ajuda'),
      content: Text(
        texto,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Fechar',
          ),
        )
      ],
    );
  }
}
