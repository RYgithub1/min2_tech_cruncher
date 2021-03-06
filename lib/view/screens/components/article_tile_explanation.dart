import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:min2_tech_cruncher/model/convert_todart/convert_todart.dart';
import 'package:min2_tech_cruncher/view/style/style.dart';  /// [tegaki]



class ArticleTileExplanation extends StatelessWidget {

  final Article article;
  const ArticleTileExplanation({this.article});


  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    // String explanationExistenceCheck = "";
    // if(article.explanation != null) {
    //   explanationExistenceCheck = article.explanation;
    // }

    DateTime _datetime = DateTime.parse(article.publishedDate);   /// [String -> Date]
    var _dateFormat = new DateFormat('yyyy/MM/dd(E) HH:mm');
    String _formattedDate = _dateFormat.format(_datetime);  /// [Date -> String]


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          // article.publishedDate,
          _formattedDate,
          style: textTheme.subtitle1.copyWith(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 4),
        Text(
          article.title,
          style: textTheme.bodyText1.copyWith(
            fontFamily: RegularFont,
          ),
        ),
      ],
    );
  }
}