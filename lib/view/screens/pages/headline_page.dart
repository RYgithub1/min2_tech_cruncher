import 'package:flutter/material.dart';
import 'package:min2_tech_cruncher/datasupport/search_type.dart';
import 'package:min2_tech_cruncher/view/screens/components/article_tile.dart';
import 'package:min2_tech_cruncher/view/screens/components/search_bar.dart';
import 'package:min2_tech_cruncher/view/screens/web_screen.dart';
import 'package:min2_tech_cruncher/viewmodel/headline_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:min2_tech_cruncher/model/convert_todart/convert_todart.dart';  /// [tegaki]




class HeadlinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /// [一発目page開いた瞬間でのデータ入手（ロード中でない&&空）]
    final headlineViewModel = Provider.of<HeadlineViewModel>(context, listen: false);
    if (!headlineViewModel.isLoading && headlineViewModel.articles.isEmpty){
      // headlineViewModel.getTechViewModel(searchType: SearchType.HEADLINE);
      Future( () => headlineViewModel.getTechViewModel(searchType: SearchType.HEADLINE) );
    }


    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SearchBar(
              /// [final ValueChanged<String>? onSubmitted; -> voidCallback関数で指定]
              /// [namedParameter]
              onSearch: (keyword) => getKeywordSearch(context, keyword),
            ),
            Expanded(
              child: Consumer<HeadlineViewModel>(
                builder: (context, viewModel, child) {
                  return viewModel.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                      itemCount: viewModel.articles.length,
                      itemBuilder: (BuildContext context, int arrayNumber) {
                        return ArticleTile(
                          article: viewModel.articles[arrayNumber],
                          onArticleClick: (article) => _openArticleWebPage(article, context),
                        );
                      },
                    );
                },
              ),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          tooltip: "refresh tech",
          // onPressed: (something) => onRefresh(context),
          /*
          Error: The argument type 'dynamic Function(dynamic)' can't be assigned to the parameter type 'void Function()'.
          onPressed: (something) => onRefresh(context),
          */
          onPressed: () => onRefreshContent(context),

        ),
      ),
    );
  }


  /// [----------- sup -----------]
  Future<void> onRefreshContent(BuildContext context) async {
    print("comm001: onRefreshContent");
    final _headlineViewModel = Provider.of<HeadlineViewModel>(context, listen: false);
    /// [現在の検索条件でのrefresh]
    // await _headlineViewModel.getTechViewModel(searchType: _headlineViewModel.searchType, keyword: _headlineViewModel.keyword);
    await _headlineViewModel.getTechViewModel(searchType: _headlineViewModel.searchType);
    print("comm002: onRefreshContent: ${_headlineViewModel.searchType}, ${_headlineViewModel.keyword}");

  }

  Future<void> getKeywordSearch(BuildContext context, keywordDa) async {
    print("comm005: getKeywordSearch");
    print("comm006: getKeywordSearch: $keywordDa");
    final _headlineViewModel = Provider.of<HeadlineViewModel>(context, listen: false);
    await _headlineViewModel.getTechViewModel(
        searchType: SearchType.KEYWORD,
        keyword: keywordDa,
    );
    // print("comm007: getKeywordSearch: $searchType");
  }




  _openArticleWebPage(Article article, BuildContext context) {
    print("comm009: _openArticleWebPage: article.url: $article");
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebScreen(article: article),
      ),
    );
  }

}