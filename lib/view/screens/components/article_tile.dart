import 'package:flutter/material.dart';
import 'package:min2_tech_cruncher/model/convert_todart/convert_todart.dart';  /// [tegaki]
import 'package:min2_tech_cruncher/view/screens/components/article_tile_explanation.dart';
import 'package:min2_tech_cruncher/view/screens/components/article_tile_image.dart';  /// [tegaki]



class ArticleTile extends StatelessWidget {

  // final List<Article> articles;
  final Article article;
  final ValueChanged onArticleClick;
  // const ArticleTile({this.article});
  /// [Click処理も渡す]
  const ArticleTile({this.article, this.onArticleClick});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Card(
        color: Colors.lightGreen[100],
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => onArticleClick(article),
            child: Row(
              children: <Widget>[

                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, right: 8),
                    child: ArticleTileImage(networkImageUrl: article.networkImage),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: ArticleTileExplanation(article: article),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}