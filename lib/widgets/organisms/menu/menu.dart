import 'package:blog/widgets/atoms/menu_button.dart';
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
        MenuButton(
          () => Navigator.pushNamed(
            context,
            '/about-author',
          ),
          label: 'About author',
        ),
        const SizedBox(height: 40.0),
        MenuButton(
          () => Navigator.pushNamed(
            context,
            '/doggy-bloggy',
          ),
          label: 'Doggy bloggy',
        ),
        const SizedBox(height: 40.0),
        MenuButton(
          () {},
          label: 'Menu item',
        ),
      ],
    );
  }
}
