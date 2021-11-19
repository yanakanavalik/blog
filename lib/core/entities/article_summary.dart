import 'package:json_annotation/json_annotation.dart';

part 'article_summary.g.dart';

@JsonSerializable()
class ArticlesSummaryResponse {
  @JsonKey(name: 'ArticlesSummaries', defaultValue: [])
  final List<ArticleSummary> articlesSummaries;

  @JsonKey(name: 'TotalCount', defaultValue: 0)
  final int totalCount;

  @JsonKey(name: 'Offset', defaultValue: 0)
  final int offset;

  ArticlesSummaryResponse({
    required this.articlesSummaries,
    required this.offset,
    required this.totalCount,
  });

  factory ArticlesSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesSummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesSummaryResponseToJson(this);
}

@JsonSerializable()
class ArticleSummary {
  @JsonKey(name: 'DateCreated', defaultValue: '')
  final String dateCreated;

  @JsonKey(name: 'Title', defaultValue: '')
  final String title;

  @JsonKey(name: 'Summary', defaultValue: '')
  final String summary;

  @JsonKey(name: 'UrlName', defaultValue: '')
  final String urlName;

  @JsonKey(name: 'Id', defaultValue: 0)
  final int id;

  ArticleSummary({
    required this.dateCreated,
    required this.title,
    required this.summary,
    required this.urlName,
    required this.id,
  });

  factory ArticleSummary.fromJson(Map<String, dynamic> json) =>
      _$ArticleSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleSummaryToJson(this);
}
