// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticlesSummaryResponse _$ArticlesSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    ArticlesSummaryResponse(
      articlesSummaries: (json['ArticlesSummaries'] as List<dynamic>?)
              ?.map((e) => ArticleSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      offset: json['Offset'] as int? ?? 0,
      totalCount: json['TotalCount'] as int? ?? 0,
    );

Map<String, dynamic> _$ArticlesSummaryResponseToJson(
        ArticlesSummaryResponse instance) =>
    <String, dynamic>{
      'ArticlesSummaries': instance.articlesSummaries,
      'TotalCount': instance.totalCount,
      'Offset': instance.offset,
    };

ArticleSummary _$ArticleSummaryFromJson(Map<String, dynamic> json) =>
    ArticleSummary(
      dateCreated: json['DateCreated'] as String? ?? '',
      title: json['Title'] as String? ?? '',
      summary: json['Summary'] as String? ?? '',
      urlName: json['UrlName'] as String? ?? '',
      id: json['Id'] as int? ?? 0,
    );

Map<String, dynamic> _$ArticleSummaryToJson(ArticleSummary instance) =>
    <String, dynamic>{
      'DateCreated': instance.dateCreated,
      'Title': instance.title,
      'Summary': instance.summary,
      'UrlName': instance.urlName,
      'Id': instance.id,
    };
