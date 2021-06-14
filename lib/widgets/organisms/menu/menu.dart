import 'package:blog/widgets/atoms/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          onTap: () {},
        ),
        MenuItem(
          onTap: () {},
        ),
        MenuItem(
          onTap: () {},
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  MenuItem({
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Button(
      buttonModification: ButtonModification.menu,
      label: 'label',
    );
  }
}