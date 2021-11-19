import 'package:blog/common/style/colors.dart';
import 'package:blog/common/utils/screen.dart';

import 'package:blog/widgets/organisms/menu/menu.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PageContainer extends StatefulWidget {
  PageContainer({
    required this.pageTitle,
    required this.pageBody,
    this.scrollController,
    Key? key,
  }) : super(key: key);

  final String pageTitle;
  final Widget pageBody;
  final ScrollController? scrollController;

  @override
  _PageContainerState createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: copperCrayolaColor,
      ),
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: getScreenHeight(context: context) / 4.0,
              right: 40.0,
              left: 40.0,
            ),
            child: Menu(),
          ),
          widget.pageBody,
        ],
      ),
    );
  }
}
