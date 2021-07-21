import 'package:blog/widgets/molecules/article_preview.dart';
import 'package:blog/widgets/organisms/page_container/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static String get path => '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      pageBody: HomePageBody(),
      pageTitle: 'header.title'.tr(),
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
