import 'package:blog/common/style/colors.dart';
import 'package:flutter/material.dart';

class TappableContainer extends StatelessWidget {
  TappableContainer({
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(16.0),
    this.width = 0.0,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteSmokeColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: padding,
      margin: margin,
      width: width,
      child: GestureDetector(
        onTap: () {
          print("Tapped a Container");
        },
        child: child,
      ),
    );
  }
}
