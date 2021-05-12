import 'package:flutter/material.dart';

import 'button_widget.dart';

class ButtonFormContainer extends StatelessWidget {
  final Function()? onCallbackSave;
  final Function()? onCallbackReset;
  final Function()? onCallbackHelp;

  ButtonFormContainer({
    Key? key,
    this.onCallbackSave,
    this.onCallbackReset,
    this.onCallbackHelp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ButtonWidget(
            margin: EdgeInsets.only(left: 10),
            labelBotao: 'Calcular',
            onCallback: onCallbackSave!,
          ),
          ButtonWidget(
            margin: EdgeInsets.only(left: 10),
            labelBotao: 'Limpar',
            onCallback: onCallbackReset!,
          ),
          ButtonWidget(
            margin: EdgeInsets.only(left: 10),
            labelBotao: 'Ajuda',
            onCallback: onCallbackHelp!,
          ),
        ],
      ),
    );
  }
}
