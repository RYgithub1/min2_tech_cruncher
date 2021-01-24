import 'package:flutter/material.dart';
import 'package:min2_tech_cruncher/datasupport/search_type.dart';
import 'package:min2_tech_cruncher/model/repository/headline_repository.dart';
import 'package:min2_tech_cruncher/model/convert_todart/convert_todart.dart';   /// [tegaki]



class  HeadlineViewModel extends ChangeNotifier {

  final HeadlineRepository _headlineRepository = HeadlineRepository();


  /// [======== Encapsulation ========]
  /// [View -> ViewModel: 欲しいproperty定義]
  SearchType _searchType = SearchType.HEADLINE;
  SearchType get searchType =>  _searchType;

  // String _keyword = SearchType.KEYWORD;
  /// [A value of type 'SearchType' can't be assigned to a variable of type 'String']
  String _keyword = "";
  String get keyword => _keyword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  /// ["Repository->ViewModel/NotifyListeners()" 用に定義]
  List<Article> _articles = [];
  List<Article> get articles => _articles;




  /// [======== Encapsulation ========]
  Future<void> getTechViewModel({@required SearchType searchType, String keyword}) async {
    print("comm201: getTechViewModel");
    _searchType: searchType;
    _keyword: keyword;

    _isLoading = true;
    notifyListeners();
    print("comm202: getTechViewModel: $_searchType, $_keyword, $_isLoading");

    // await _headlineRepository.getTechRepository(searchType: _searchType, keyword: _keyword);
    /// ["Repository->ViewModel/NotifyListeners()" 用に定義]
    _articles = await _headlineRepository.getTechRepository(searchType: _searchType, keyword: _keyword);

    _isLoading = false;
    notifyListeners();
    print("comm203: getTechViewModel: $_searchType, $_keyword, $_isLoading");
  }



  @override
  void dispose() {
    _headlineRepository.dispose();
    super.dispose();
  }
}