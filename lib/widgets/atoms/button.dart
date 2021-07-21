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
    required this.onTap,
  });

  final ButtonModification buttonModification;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle outlineButtonStyle = TextButton.styleFrom(
      primary: darkJungleGreenColor,
      //minimumSize: Size(88.0, 36.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      textStyle: TextStyle(color: darkJungleGreenColor, fontSize: 24.0),
    );

    return TextButton(
      style: outlineButtonStyle,
      onPressed: onTap,
      child: Text(label),
    );
  }
}
