import 'package:blog/common/style/colors.dart';
import 'package:flutter/material.dart';

enum ButtonModification {
  submit,
  cancel,
  menu,
}

class Button extends StatelessWidget {
  Button({
    required this.buttonModification,
    required this.label,
  });

  final ButtonModification buttonModification;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle outlineButtonStyle = TextButton.styleFrom(
      primary: darkJungleGreenColor,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      textStyle: TextStyle(color: darkJungleGreenColor, fontSize: 24.0),
    );

    return TextButton(
      style: outlineButtonStyle,
      onPressed: () {},
      child: Text(label),
    );
  }
}
