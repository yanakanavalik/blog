import 'package:blog/common/style/colors.dart';

import 'package:blog/widgets/molecules/article_preview.dart';
import 'package:blog/widgets/molecules/loader.dart';
import 'package:blog/widgets/organisms/page_container/index.dart';
import 'package:blog/widgets/pages/home/socials.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static String get path => '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageBloc _bloc;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _bloc = HomePageBloc();
    _scrollController = ScrollController();

    _bloc.add(LoadArticles());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      bloc: _bloc,
      builder: (context, state) {
        late Widget pageBody;

        if (state.articleSummaries.length == 0) {
          if (state.isError) {
            pageBody = SliverToBoxAdapter(child: Text('ERROR'));
          } else {
            pageBody = SliverToBoxAdapter(
              child: Center(child: Loader(color: tumbleweedColor)),
            );
          }
        } else {
          pageBody = SliverPadding(
            padding: const EdgeInsets.only(top: 40.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index >= _bloc.state.articleSummaries.length) {
                    if (!_bloc.state.isLoading) {
                      _bloc.add(LoadArticles());
                    }
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Loader(color: tumbleweedColor),
                      ),
                    );
                  }
                  return ArticlePreview(
                    articleSummary: _bloc.state.articleSummaries[index],
                  );
                },
                childCount: _bloc.state.totalArticles >
                        _bloc.state.articleSummaries.length
                    ? _bloc.state.articleSummaries.length + 1
                    : _bloc.state.articleSummaries.length, // 1000 list items
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
          scrollController: _scrollController,
        );
      },
    );
  }
}
