// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      dateCreated: json['DateCreated'] as String? ?? '',
      title: json['Title'] as String? ?? '',
      paragraphs: (json['Paragraphs'] as List<dynamic>?)
              ?.map((e) => Paragraph.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      urlName: json['UrlName'] as String? ?? '',
      id: json['Id'] as int? ?? 0,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'DateCreated': instance.dateCreated,
      'Title': instance.title,
      'UrlName': instance.urlName,
      'Paragraphs': instance.paragraphs,
      'Id': instance.id,
    };

Paragraph _$ParagraphFromJson(Map<String, dynamic> json) => Paragraph(
      text:
          (json['Text'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      title: json['Title'] as String? ?? '',
    );

Map<String, dynamic> _$ParagraphToJson(Paragraph instance) => <String, dynamic>{
      'Title': instance.title,
      'Text': instance.text,
    };
