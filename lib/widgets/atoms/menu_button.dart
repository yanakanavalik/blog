import 'package:blog/common/style/colors.dart';
import 'package:blog/widgets/atoms/animated_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuButton extends StatefulWidget {
  const MenuButton(this.onTap, {this.label = "", Key? key}) : super(key: key);

  final VoidCallback onTap;
  final String label;

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool isHovered = false;
  double x = 0.0;
  double y = 0.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _incrementEnter,
      onHover: _updateLocation,
      onExit: _incrementExit,
      child: AnimatedButton(
        onPress: widget.onTap,
        height: 70.0,
        width: 200.0,
        text: widget.label,
        textStyle: TextStyle(fontSize: 20.0, color: charlestonGreenColor),
        selectedTextColor: whiteSmokeColor,
        transitionType: TransitionType.CENTER_LR_OUT,
        backgroundColor: Colors.white,
        selectedBackgroundColor: tumbleweedColor,
        isSelected: isHovered,
      ),
    );
  }

  void _incrementEnter(PointerEvent details) {
    print('entered');
    setState(() {
      isHovered = true;
    });
  }

  void _incrementExit(PointerEvent details) {
    print('left');
    setState(() {
      isHovered = false;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }
}
