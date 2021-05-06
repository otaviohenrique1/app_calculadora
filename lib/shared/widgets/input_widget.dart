import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String labelCampo;
  final Function(String?)? onCallback;
  final TextInputType? keyboardType;
  final String? mensagemCampoErro;

  InputWidget(
      {Key? key,
      required this.labelCampo,
      required this.keyboardType,
      required this.mensagemCampoErro,
      required this.onCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      // padding: EdgeInsets.symmetric(
      //   horizontal: 15,
      //   vertical: 5,
      // ),
      child: TextFormField(
        decoration: InputDecoration(labelText: labelCampo),
        keyboardType: keyboardType,
        validator: (value) {
          if (value!.isEmpty) {
            return mensagemCampoErro;
          }
        },
        onSaved: onCallback,
      ),
    );
  }
}
