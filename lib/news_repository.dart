import 'package:dio/dio.dart';

class NewsRepository{

  final dio = Dio();

  Future<List> getHttp() async {
    final response = await dio.get(
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=abd54b62ea5c421eb2608de5613d0018",
    );
    return response.data['articles'];
  }
}