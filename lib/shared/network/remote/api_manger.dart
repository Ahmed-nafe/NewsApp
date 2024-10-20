import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:newsapp/Model/NewsDataModel.dart';
import 'package:newsapp/Model/SourceResponse.dart';
import 'package:newsapp/shared/components/components.dart';

class ApiManger {
  static Future<SourceResponse> getSource() async {
    final response = await Dio().get(
        '${Constants.Base_Url}/v2/top-headlines/sources',
            queryParameters: {
          'apiKey':Constants.Api_Key
            }
              );
    SourceResponse sourceModel = SourceResponse.fromJson(response.data);
    return sourceModel;
  }

  static Future<NewsDataModel> getNewsData(String sourceId) async {
    final response = await Dio().get(
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=abd54b62ea5c421eb2608de5613d0018&sources=$sourceId');
    NewsDataModel newsModel = NewsDataModel.fromJson(response.data);
    return newsModel;
  }
}
