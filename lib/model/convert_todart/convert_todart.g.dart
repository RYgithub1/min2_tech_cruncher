// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_todart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tech _$TechFromJson(Map<String, dynamic> json) {
  return Tech(
    articles: (json['articles'] as List)
        ?.map((e) =>
            e == null ? null : Article.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TechToJson(Tech instance) => <String, dynamic>{
      'articles': instance.articles,
    };

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    title: json['title'] as String,
    explanation: json['description'] as String,
    url: json['url'] as String,
    networkImage: json['urlToImage'] as String,
    publishedDate: json['publishedAt'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.explanation,
      'url': instance.url,
      'urlToImage': instance.networkImage,
      'publishedAt': instance.publishedDate,
      'content': instance.content,
    };
