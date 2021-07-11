import 'package:blog/common/style/colors.dart';
import 'package:blog/common/utils/screen.dart';
import 'package:blog/widgets/molecules/article_preview.dart';
import 'package:blog/widgets/organisms/menu/menu.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('header.title').tr(),
        backgroundColor: copperCrayolaColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              width: double.infinity,
              child: HomePageBody(),
            ),
          ),
          Positioned(
            left: 40.0,
            top: getScreenHeight(context: context) / 2.5,
            child: Menu(),
          ),
        ],
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArticlePreview(),
        ArticlePreview(),
        ArticlePreview(),
        ArticlePreview(),
        ArticlePreview(),
        ArticlePreview(),
        ArticlePreview(),
        ArticlePreview(),
        ArticlePreview(),
        ArticlePreview(),
      ],
    );
  }
}
