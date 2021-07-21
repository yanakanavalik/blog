import 'package:blog/widgets/organisms/page_container/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({
    required this.id,
    Key? key,
  }) : super(key: key);

  final String id;

  static String get path => '/article/:id';

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      pageTitle: 'loading',
      pageBody: Column(
        children: [
          Text('Page with id: ${widget.id}'),
        ],
      ),
    );
  }
}
