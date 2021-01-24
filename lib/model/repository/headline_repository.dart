import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:min2_tech_cruncher/datasupport/search_type.dart';
import 'package:min2_tech_cruncher/model/api/api_service.dart';
import 'package:min2_tech_cruncher/model/convert_todart/convert_todart.dart';   /// [tegaki]



class HeadlineRepository {

  /// [staticゆえ、CLASS.method()でcall]
  final ApiService _apiService = ApiService.create();


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
          print("comm303: [◯/◯]: ${_resultArticleLists[0].title}");
        } else {   /// [◯/x]
          final _responseError = _response.error;
          final _responseStatusCode = _response.statusCode;
          print("comm304: [◯/x]: $_responseError");
          print("comm305: [◯/x]: $_responseStatusCode");
        }

    } catch(err) {
      print("comm306: [x/-]: $err");
    } finally {
      print("comm307: finally");
    }

    return _resultArticleLists;
  }


  void dispose() {
    _apiService.dispose();
  }
}
