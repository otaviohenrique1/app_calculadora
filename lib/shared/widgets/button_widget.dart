import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? labelBotao;
  final Function()? onCallback;
  final EdgeInsetsGeometry margin;
//
  ButtonWidget(
      {Key? key,
      required this.labelBotao,
      required this.onCallback,
      required this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      // padding: EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Text(
            labelBotao!,
            style: TextStyle(fontSize: 15),
          ),
        ),
        onPressed: onCallback!,
      ),
    );
  }
}
