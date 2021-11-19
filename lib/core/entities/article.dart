import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  @JsonKey(name: 'DateCreated', defaultValue: '')
  final String dateCreated;

  @JsonKey(name: 'Title', defaultValue: '')
  final String title;

  @JsonKey(name: 'UrlName', defaultValue: '')
  final String urlName;

  @JsonKey(name: 'Paragraphs', defaultValue: [])
  final List<Paragraph> paragraphs;

  @JsonKey(name: 'Id', defaultValue: 0)
  final int id;

  Article({
    required this.dateCreated,
    required this.title,
    required this.paragraphs,
    required this.urlName,
    required this.id,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class Paragraph {
  @JsonKey(name: 'Title', defaultValue: '')
  final String title;

  @JsonKey(name: 'Text', defaultValue: [])
  final List<String> text;

  Paragraph({
    this.text = const [],
    this.title = '',
  });

  factory Paragraph.fromJson(Map<String, dynamic> json) =>
      _$ParagraphFromJson(json);

  Map<String, dynamic> toJson() => _$ParagraphToJson(this);
}
