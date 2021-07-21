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
          label: 'About author',
          onTap: () => Navigator.pushNamed(
            context,
            '/about-author',
          ),
        ),
        const SizedBox(height: 40.0),
        MenuItem(
          label: 'Menu item',
          onTap: () {},
        ),
        const SizedBox(height: 40.0),
        MenuItem(
          label: 'Menu item',
          onTap: () {},
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  MenuItem({
    required this.label,
    required this.onTap,
  });

  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Button(
      buttonModification: ButtonModification.menu,
      label: label,
      onTap: onTap,
    );
  }
}
