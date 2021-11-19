import 'dart:convert';
import 'dart:core';

import 'package:blog/core/entities/article.dart';
import 'package:blog/core/request_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ArticlePageState {
  const ArticlePageState._({
    this.articleId = null,
    this.isError = false,
    this.isLoading = false,
    this.article = null,
  });

  const ArticlePageState.loading({
    int? articleId,
  }) : this._(
          isLoading: true,
          isError: false,
          articleId: articleId,
        );

  const ArticlePageState.error()
      : this._(
          isLoading: false,
          isError: true,
        );

  const ArticlePageState.base({
    Article? article,
    int? articleId,
  }) : this._(
          article: article,
          articleId: articleId,
          isLoading: false,
          isError: false,
        );

  final int? articleId;
  final Article? article;
  final bool isLoading;
  final bool isError;
}

abstract class ArticlePageEvent {}

class LoadArticle extends ArticlePageEvent {}

class ArticlePageBlocParameter {
  final int? articleId;

  const ArticlePageBlocParameter({
    this.articleId,
  });
}

class ArticlePageBloc extends Bloc<ArticlePageEvent, ArticlePageState> {
  final ArticlePageBlocParameter parameter;

  ArticlePageBloc({
    this.parameter = const ArticlePageBlocParameter(),
  }) : super(ArticlePageState.base()) {
    on<LoadArticle>(
      (event, emit) async {
        try {
          emit(ArticlePageState.loading(articleId: parameter.articleId));

          if (parameter.articleId == null) {
            emit(ArticlePageState.error());
          }

          final response = await _fetchArticleData(
            id: parameter.articleId!,
          );

          if (response.statusCode == 200) {
            var decoded = jsonDecode(response.body)[0];

            Article article = Article.fromJson(decoded);

            emit(ArticlePageState.base(
              article: article,
              articleId: parameter.articleId,
            ));
          } else {
            throw Exception('Failed to load article');
          }
        } catch (_) {
          emit(ArticlePageState.error());
        }
      },
    );
  }

  Future<http.Response> _fetchArticleData({
    required int id,
  }) {
    return RequestHandler.getArticleById(id: id);
  }
}
