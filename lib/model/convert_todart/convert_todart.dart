/// [ApiからHttp通信(Chopper)でデータ取得 -> Json(Map形式)をDart形式に変換]


import 'package:json_annotation/json_annotation.dart';


part 'convert_todart.g.dart';



@JsonSerializable()
class Tech {
  final List<Article> articles;
  Tech({this.articles});

  factory Tech.fromJson(Map<String, dynamic> json) => _$TechFromJson(json);
  Map<String, dynamic> toJson() => _$TechToJson(this);
}


@JsonSerializable()
class Article {
  final String title;
  @JsonKey(name: "description") final String explanation;
  final String url;
  @JsonKey(name: "urlToImage") final String networkImage;
  @JsonKey(name: "publishedAt") final String publishedDate;
  final String content;

  Article({this.title, this.explanation, this.url, this.networkImage, this.publishedDate, this.content});

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
