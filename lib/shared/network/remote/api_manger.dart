import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:newsapp/Model/NewsDataModel.dart';
import 'package:newsapp/Model/SourceResponse.dart';
import 'package:newsapp/shared/components/components.dart';

class ApiManger {
  static Future<SourceResponse> getSource(String categoryId) async {
    final response = await Dio().get(
        '${Constants.Base_Url}/v2/top-headlines/sources',
        queryParameters: {'apiKey': Constants.Api_Key, 'category': categoryId});
    SourceResponse sourceModel = SourceResponse.fromJson(response.data);
    return sourceModel;
  }


}
