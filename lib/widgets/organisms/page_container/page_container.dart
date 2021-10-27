import 'package:blog/common/style/colors.dart';
import 'package:blog/common/utils/screen.dart';

import 'package:blog/widgets/organisms/menu/menu.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageContainer extends StatefulWidget {
  PageContainer({
    required this.pageTitle,
    required this.pageBody,
    Key? key,
  }) : super(key: key);

  final String pageTitle;
  final Widget pageBody;

  @override
  _PageContainerState createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
        backgroundColor: copperCrayolaColor,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: double.infinity,
              child: widget.pageBody,
            ),
          ),
          Positioned(
            left: 40.0,
            top: getScreenHeight(context: context) / 4.0,
            child: Menu(),
          ),
        ],
      ),
    );
  }
}
