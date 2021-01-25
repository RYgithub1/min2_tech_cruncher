import 'package:min2_tech_cruncher/model/database/database_table.dart';   /// [tegaki]
import 'package:min2_tech_cruncher/model/convert_todart/convert_todart.dart';   /// [tegaki]



/// [extension関数: 1行ずつ変換して返す]
/// [Dartモデルクラス -> DBテーブルクラス]
extension ConvertToArticleRecord on List<Article> {
  List<DatabaseTable> toArticleRecords(List<Article> articles){
    /// [(List<Article> articles)でないと、受け渡しの型が異なり渡せない]

    var articleRecords = [];
    articles.forEach(
      (element) {
        articleRecords.add(
          DatabaseTable(
            title: element.title ?? "",
            explanation: element.explanation ?? "",
            url: element.url ?? "",
            networkImage: element.networkImage ?? "",
            publishedDate: element.publishedDate ?? "",
            content: element.content ?? "",
          ),
        );
      },
    );
    return articleRecords;

  }
}



/// [DBテーブルクラス -> Dartモデルクラス]
extension ConvertToArticle on List<DatabaseTable> {
  List<Article> toArticles(List<DatabaseTable> articleRecords){

    var articles = [];
    articleRecords.forEach(
      (elementTwo) {
        articles.add(
          Article(
            title: elementTwo.title ?? "",
            explanation: elementTwo.explanation ?? "",
            url: elementTwo.url ?? "",
            networkImage: elementTwo.networkImage ?? "",
            publishedDate: elementTwo.publishedDate ?? "",
            content: elementTwo.content ?? "",
          ),
        );
      },
    );
    return articles;

  }
}