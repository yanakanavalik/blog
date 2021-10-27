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
    this.color,
  });

  final ButtonModification buttonModification;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle textButtonStyle = _getButtonStyle(
      buttonModification: buttonModification,
    );

    return TextButton(
      style: textButtonStyle,
      onPressed: onTap,
      child: Text(label),
    );
  }

  ButtonStyle _getButtonStyle({
    ButtonModification buttonModification = ButtonModification.submit,
  }) {
    switch (buttonModification) {
      case ButtonModification.menu:
        return TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          primary: color ?? darkJungleGreenColor,
          textStyle: TextStyle(
            color: color ?? darkJungleGreenColor,
            fontSize: 24.0,
          ),
          backgroundColor: color,
        ).copyWith(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        );
      default:
        return TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          primary: tumbleweedColor,
          backgroundColor: tumbleweedColor,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ).copyWith(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        );
    }
  }
}
