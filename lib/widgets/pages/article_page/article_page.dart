import 'package:blog/common/style/colors.dart';
import 'package:blog/widgets/molecules/loader.dart';
import 'package:blog/widgets/organisms/page_container/index.dart';
import 'package:blog/widgets/pages/home/socials.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'article_page_bloc.dart';

class ArticlePageParameter {
  final int? id;

  ArticlePageParameter({this.id});
}

class ArticlePage extends StatefulWidget {
  ArticlePage({
    required this.parameter,
    Key? key,
  }) : super(key: key);

  final ArticlePageParameter parameter;

  static String get path => '/article/:id';

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  late ArticlePageBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = ArticlePageBloc(
      parameter: ArticlePageBlocParameter(articleId: widget.parameter.id),
    );

    _bloc.add(LoadArticle());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlePageBloc, ArticlePageState>(
        bloc: _bloc,
        builder: (context, state) {
          late Widget pageBody;

          if (state.article == null) {
            if (state.isError) {
              pageBody = SliverToBoxAdapter(child: Text('ERROR'));
            } else {
              pageBody = SliverFillRemaining(
                child: Center(child: Loader(color: tumbleweedColor)),
              );
            }
          } else {
            pageBody = SliverPadding(
              padding: const EdgeInsets.only(top: 40.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text(state.article?.title ?? ''),
                  ],
                ),
              ),
            );


          }

          return PageContainer(
            pageBody: Expanded(
              child: CustomScrollView(
                slivers: [
                  pageBody,
                  SliverToBoxAdapter(child: Socials()),
                ],
              ),
            ),
            pageTitle: 'Blog by Yana Kanavalik',
          );
        });
  }
}
