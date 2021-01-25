import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:min2_tech_cruncher/datasupport/search_type.dart';
import 'package:min2_tech_cruncher/main.dart';
import 'package:min2_tech_cruncher/model/api/api_service.dart';
import 'package:min2_tech_cruncher/model/convert_todart/convert_todart.dart';   /// [tegaki]
import 'package:min2_tech_cruncher/model/database/database_dao.dart';
import 'package:min2_tech_cruncher/model/extension/extension.dart';   /// [tegaki]




class HeadlineRepository {

  /// [staticゆえ、CLASS.method()でcall]
  // final ApiService _apiService = ApiService.create();
  /// [````` For ProxyProvider `````]
  final ApiService _apiService;
  final DatabaseDao _dao;
  HeadlineRepository({dao, apiService}) : _apiService = apiService, _dao = dao;


  /// [<void> -> <List<Article>>: api/convertToDartして取得したデータの形式と型]
  Future<List<Article>> getTechRepository({@required SearchType searchType, String keyword}) async {
    print("comm301: getTechRepository: $searchType, $keyword");

    /// [Repo->api->convertTodart->Repo: データ取得成否のResponse（まだJson形式）]
    Response _response;
    /// [データ成功時の格納用]
    List<Article> _resultArticleLists = [];


    /// [response/data: ◯x-]
    try {
        switch(searchType){
          case SearchType.HEADLINE:
            _response = await _apiService.getHeadlineChoppers();
            break;
          case SearchType.KEYWORD:
            _response = await _apiService.getKeywordChoppers(keyword: keyword);
            break;
        }
        if(_response.isSuccessful) {   /// [◯/◯]
          final _responseBody = _response.body;
          /// [convertToDartファイルでconvert]
          _resultArticleLists = Tech.fromJson(_responseBody).articles;
          print("comm303_v1: [◯/◯]: ${_resultArticleLists[0].title}");

          _resultArticleLists = await insertAndReadFromDB(_responseBody);
          print("comm303_v2: [◯/◯]: ${_resultArticleLists[0].title}");


        } else {   /// [◯/x]
          final _responseError = _response.error;
          final _responseStatusCode = _response.statusCode;
          print("comm304: [◯/x]: $_responseError");
          print("comm305: [◯/x]: $_responseStatusCode");
        }

    // } catch(err) {
    } on Exception catch(err) {
      print("comm306: [x/-]: $err");
    } finally {
      print("comm307: finally");
    }

    /// [If there is no keyword on the article]
    /// [RangeError (index): Invalid value: Valid value range is empty: 0]
    print("comm308: ${_resultArticleLists.length}");
    return _resultArticleLists;
  }




  void dispose() {
    _apiService.dispose();
  }


  /// [via DB section]
  Future<List<Article>> insertAndReadFromDB(responseBody) async {
    // final _dao = myDatabase.databaseDao;
  /// [````` For ProxyProvider `````]


    final articles = Tech.fromJson(responseBody).articles;

    /// [webから取得したTechリストを、DBのテーブルクラス(Article)に変換、してDB登録]
    final databaseTables = await _dao.insertAndReadNeawsFromDB(
      articles.toArticleRecords(articles)
    );

    /// [DBから取得したデータを、モデルクラスに再変換、して返す]
    return databaseTables.toArticles(databaseTables);
  }

}
