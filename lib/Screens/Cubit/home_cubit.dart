import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../../Model/NewsDataModel.dart';
import '../../Model/SourceResponse.dart';
import '../../shared/components/components.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Sources> sources = [];
  List<Articles> articles = [];
  int index = 0;

  Future<void> getSource(String categoryId) async {
    emit(NewsLoading());
    Dio().get('${Constants.Base_Url}/v2/top-headlines/sources',
        queryParameters: {
          'apiKey': Constants.Api_Key,
          'category': categoryId
        }).then((response) {
      SourceResponse sourceModel = SourceResponse.fromJson(response.data);
      sources = sourceModel.sources ?? [];
      emit(
        SourcesLoaded(),
      );
    }).catchError((onError) {
      emit(NewsError(onError.toString()));
    });
  }

  Future<void> getNewsData() async {
    emit(NewsLoading());
    Dio()
        .get(
            'https://newsapi.org/v2/everything?q=bitcoin&apiKey=0e8dec04bb8f4b438ea0180866301453&sources=${sources[index].id}')
        .then((response) {
      NewsDataModel newsModel = NewsDataModel.fromJson(response.data);
      articles = newsModel.articles ?? [];
      emit(NewsLoaded());
    }).catchError((onError) {
      emit(NewsError(onError.toString()));
    });
  }

  changeSourceState(int value) {
    emit(NewsLoaded());
    index = value;
    emit(
      ChangeNewsState(),
    );
  }
}
