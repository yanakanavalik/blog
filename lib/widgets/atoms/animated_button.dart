import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Color selectedTextColor;
  final Color selectedBackgroundColor;
  final String selectedText;
  final Color backgroundColor;
  final bool enable;
  final int textMaxLine;
  final TextOverflow textOverflow;
  final AlignmentGeometry textAlignment;
  final Duration animationDuration;
  final double width;
  final double height;
  final VoidCallback onPress;
  final TransitionType transitionType;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final bool isSelected;

  const AnimatedButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.transitionType = TransitionType.LEFT_TO_RIGHT,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 20),
    this.selectedTextColor = Colors.blue,
    this.selectedBackgroundColor = Colors.white,
    this.backgroundColor = Colors.white60,
    this.textMaxLine = 1,
    this.textOverflow = TextOverflow.clip,
    this.textAlignment = Alignment.center,
    this.height = 50,
    this.width = double.infinity,
    this.animationDuration = const Duration(milliseconds: 500),
    this.enable = true,
    this.borderColor = Colors.transparent,
    this.borderRadius = 0,
    this.borderWidth = 0,
    this.isSelected = false,
    this.selectedText = '',
  }) : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<double> slideAnimation;
  Animation? scaleAnimation;
  double? slideBegin;
  double? slideEnd;

  AnimationController? get animationController => _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: widget.animationDuration, vsync: this);

    if (widget.transitionType == TransitionType.RIGHT_TO_LEFT ||
        widget.transitionType == TransitionType.BOTTOM_TO_TOP) {
      slideBegin = 1.0;
      slideEnd = 0.0;
    } else {
      slideBegin = 0.0;
      slideEnd = 1.0;
    }

    final Animation curve =
        CurvedAnimation(parent: _controller!, curve: Curves.easeInOutCubic);
    slideAnimation = Tween(begin: slideBegin, end: slideEnd)
        .animate(curve as Animation<double>);

    widget.isSelected ? _controller!.forward() : _controller!.reverse();
  }

  @override
  void didUpdateWidget(covariant AnimatedButton oldWidget) {
    if (oldWidget.isSelected != widget.isSelected) {
      widget.isSelected ? _controller!.forward() : _controller!.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // deSelected/normal text
    var textNormal = Text(
      widget.text,
      maxLines: widget.textMaxLine,
      overflow: widget.textOverflow,
      style: widget.textStyle,
    );
    // selected text
    var textSelected = Text(
      widget.selectedText.isNotEmpty ? widget.selectedText : widget.text,
      maxLines: widget.textMaxLine,
      overflow: widget.textOverflow,
      style: widget.textStyle.copyWith(color: widget.selectedTextColor),
    );

    return Stack(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            border: Border.all(
              color: widget.borderColor,
              width: widget.borderWidth,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            onTap: () => onButtonClick(),
            child: Align(
              child: textNormal,
              alignment: widget.textAlignment,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _controller!,
          child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.selectedBackgroundColor,
                border: Border.all(
                  color: widget.borderColor,
                  width: widget.borderWidth,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                onTap: () => onButtonClick(),
                child: Align(
                  child: textSelected,
                  alignment: widget.textAlignment,
                ),
              )),
          builder: (context, child) {
            return ClipPath(
              clipper: RectClipper(slideAnimation.value, widget.transitionType),
              child: child,
            );
          },
        ),
      ],
    );
  }

  onButtonClick() {
    if (widget.enable) {
      if (_controller!.isCompleted) {
        _controller!.reverse();
      } else {
        _controller!.forward();
      }
      widget.onPress.call();
    }
  }
}

enum TransitionType {
  LEFT_TO_RIGHT,
  RIGHT_TO_LEFT,
  TOP_TO_BOTTOM,
  BOTTOM_TO_TOP,
  CENTER_LR_IN,
  CENTER_TB_IN,
  CENTER_LR_OUT,
  CENTER_TB_OUT,
  LEFT_TOP_ROUNDER,
  LEFT_CENTER_ROUNDER,
  LEFT_BOTTOM_ROUNDER,
  RIGHT_BOTTOM_ROUNDER,
  RIGHT_TOP_ROUNDER,
  RIGHT_CENTER_ROUNDER,
  TOP_CENTER_ROUNDER,
  BOTTOM_CENTER_ROUNDER,
  CENTER_ROUNDER,
}
enum StripTransitionType {
  LEFT_TO_RIGHT,
  RIGHT_TO_LEFT,
  TOP_TO_BOTTOM,
  BOTTOM_TO_TOP
}

class RectClipper extends CustomClipper<Path> {
  final double clipFactor;
  final TransitionType transitionType;

  RectClipper(this.clipFactor, this.transitionType);

  @override
  Path getClip(Size size) {
    Path path = Path();

    switch (transitionType) {
      case TransitionType.LEFT_TO_RIGHT:
        path.lineTo(size.width * clipFactor, 0.0);
        path.lineTo(size.width * clipFactor, size.height);
        path.lineTo(0.0, size.height);
        break;
      case TransitionType.RIGHT_TO_LEFT:
        path.moveTo(size.width, 0.0);
        path.lineTo(size.width * clipFactor, 0.0);
        path.lineTo(size.width * clipFactor, size.height);
        path.lineTo(size.width, size.height);
        break;

      case TransitionType.TOP_TO_BOTTOM:
        path.lineTo(0.0, size.height * clipFactor);
        path.lineTo(size.width, size.height * clipFactor);
        path.lineTo(size.width, 0.0);
        break;
      case TransitionType.BOTTOM_TO_TOP:
        path.moveTo(0.0, size.height);
        path.lineTo(0.0, size.height * clipFactor);
        path.lineTo(size.width, size.height * clipFactor);
        path.lineTo(size.width, size.height);

        break;
      case TransitionType.CENTER_LR_IN:
        path.moveTo(size.width / 2 * clipFactor, 0);
        path.lineTo(0, 0);
        path.lineTo(0, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, 0);
        path.lineTo(size.width - (size.width / 2 * clipFactor), 0);
        path.lineTo(size.width - (size.width / 2 * clipFactor), size.height);
        path.lineTo(size.width / 2 * clipFactor, size.height);

        break;
      case TransitionType.CENTER_TB_IN:
        path.moveTo(0, size.height / 2 * clipFactor);
        path.lineTo(0, 0);
        path.lineTo(size.width, 0);
        path.lineTo(size.width, size.height / 2 * clipFactor);
        path.lineTo(0, size.height / 2 * clipFactor);
        path.lineTo(0, size.height);
        path.lineTo(size.width, size.height);
        path.lineTo(size.width, size.height - (size.height / 2 * clipFactor));
        path.lineTo(0, size.height - (size.height / 2 * clipFactor));
        break;
      case TransitionType.CENTER_LR_OUT:
        var halfWidth = size.width / 2;
        var clipFactorWidth = halfWidth * clipFactor;
        path.moveTo(halfWidth, 0.0);
        path.lineTo(halfWidth - clipFactorWidth, 0);
        path.lineTo(halfWidth - clipFactorWidth, size.height);
        path.lineTo(halfWidth + clipFactorWidth, size.height);
        path.lineTo(halfWidth + clipFactorWidth, 0);
        break;
      case TransitionType.CENTER_TB_OUT:
        var halfHeight = size.height / 2;
        var clipFactorHeight = halfHeight * clipFactor;
        path.moveTo(0.0, halfHeight);
        path.lineTo(0, halfHeight - clipFactorHeight);
        path.lineTo(size.width, halfHeight - clipFactorHeight);
        path.lineTo(size.width, halfHeight + clipFactorHeight);
        path.lineTo(0.0, halfHeight + clipFactorHeight);
        break;
      case TransitionType.LEFT_TOP_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(0, 0),
            radius:
                (sqrt((size.width * size.width) + (size.height * size.height)) *
                    clipFactor)));
        break;
      case TransitionType.LEFT_BOTTOM_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(0, size.height),
            radius:
                (sqrt((size.width * size.width) + (size.height * size.height)) *
                    clipFactor)));
        break;
      case TransitionType.LEFT_CENTER_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(0, size.height / 2),
            radius:
                (sqrt((size.width * size.width) + (size.height * size.height)) *
                    clipFactor)));
        break;
      case TransitionType.RIGHT_BOTTOM_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(size.width, size.height),
            radius:
                (sqrt((size.width * size.width) + (size.height * size.height)) *
                    clipFactor)));
        break;
      case TransitionType.RIGHT_TOP_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(size.width, 0),
            radius:
                (sqrt((size.width * size.width) + (size.height * size.height)) *
                    clipFactor)));
        break;
      case TransitionType.RIGHT_CENTER_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(size.width, size.height / 2),
            radius:
                (sqrt((size.width * size.width) + (size.height * size.height)) *
                    clipFactor)));
        break;
      case TransitionType.TOP_CENTER_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(size.width / 2, 0),
            radius:
                (sqrt((size.width * size.width) + (size.height * size.height)) *
                    clipFactor)));
        break;
      case TransitionType.BOTTOM_CENTER_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(size.width / 2, size.height),
            radius:
                (sqrt((size.width * size.width) + (size.height * size.height)) *
                    clipFactor)));
        break;
      case TransitionType.CENTER_ROUNDER:
        path.addOval(Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius:
                (sqrt((size.width * size.width) + (size.height * size.height)) *
                    clipFactor)));
        break;
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
