import 'dart:convert';
import 'dart:core';

import 'package:blog/core/entities/article_summary.dart';
import 'package:blog/core/request_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomePageState {
  const HomePageState._({
    this.articleSummaries = const [],
    this.isError = false,
    this.isLoading = false,
    this.articlesOffset = 0,
    this.totalArticles = 0,
  });

  const HomePageState.loading({
    List<ArticleSummary> articleSummaries = const [],
    int articlesOffset = 0,
    int totalArticles = 0,
  }) : this._(
          isLoading: true,
          isError: false,
          articleSummaries: articleSummaries,
          articlesOffset: articlesOffset,
          totalArticles: totalArticles,
        );

  const HomePageState.error({
    List<ArticleSummary> articleSummaries = const [],
    int articlesOffset = 0,
    int totalArticles = 0,
  }) : this._(
          isLoading: false,
          isError: true,
          articleSummaries: articleSummaries,
          articlesOffset: articlesOffset,
          totalArticles: totalArticles,
        );

  const HomePageState.base({
    List<ArticleSummary> articleSummaries = const [],
    int articlesOffset = 0,
    int totalArticles = 0,
  }) : this._(
          articleSummaries: articleSummaries,
          articlesOffset: articlesOffset,
          totalArticles: totalArticles,
          isLoading: false,
          isError: false,
        );

  final List<ArticleSummary> articleSummaries;
  final bool isError;
  final bool isLoading;
  final int articlesOffset;
  final int totalArticles;
}

abstract class HomePageEvent {}

class LoadArticles extends HomePageEvent {}

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState.base()) {
    on<LoadArticles>(
      (event, emit) async {
        try {
          emit(HomePageState.loading(
            articleSummaries: this.state.articleSummaries,
            articlesOffset: this.state.articlesOffset,
            totalArticles: this.state.totalArticles,
          ));

          final response = await _fetchArticlesSummaries(
            offset: this.state.articlesOffset,
          );

          if (response.statusCode == 200) {
            var decoded = jsonDecode(response.body)[0];

            ArticlesSummaryResponse articlesResponse =
                ArticlesSummaryResponse.fromJson(decoded);

            List<ArticleSummary> updatedArticles = [];

            updatedArticles.addAll(this.state.articleSummaries);
            updatedArticles.addAll(articlesResponse.articlesSummaries);

            emit(HomePageState.base(
              articleSummaries: updatedArticles,
              articlesOffset: articlesResponse.offset + 10,
              totalArticles: articlesResponse.totalCount,
            ));
          } else {
            throw Exception('Failed to load article');
          }
        } catch (_) {
          emit(HomePageState.error(
            articleSummaries: this.state.articleSummaries,
            articlesOffset: this.state.articlesOffset,
            totalArticles: this.state.totalArticles,
          ));
        }
      },
    );
  }

  Future<http.Response> _fetchArticlesSummaries({
    required int offset,
    int limit = 10,
  }) {
    return RequestHandler.getSummaries(offset: offset, limit: limit);
  }
}
