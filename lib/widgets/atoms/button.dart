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
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      primary: darkJungleGreenColor,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      textStyle: TextStyle(color: darkJungleGreenColor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
    );

    return OutlinedButton(
      style: outlineButtonStyle,
      onPressed: () {},
      child: Text(label),
    );
  }
}
