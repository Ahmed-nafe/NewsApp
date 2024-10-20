import 'package:bloc/bloc.dart';
import 'package:newsapp/Model/NewsDataModel.dart';
import 'package:newsapp/Model/SourceResponse.dart';

import '../shared/network/remote/api_manger.dart';

part 'news__state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

 getSources() async {
    emit(NewsLoading());
    try {
      final sources = await ApiManger.getSource();
      emit(
        SourcesLoaded(source: sources.sources ?? []),
      );
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }


}

//   Future<void> fetchData() async {
//       try {
//         emit(NewsLoading());
//       List<Articles> response = await NewsRepository.getHttp();
//       if (response.isNotEmpty) {
//         emit(NewsLoaded(sources: response));
//       } else {
//         emit(NewsError("No data found."));
//       }
//     } on Exception catch (e) {
//       NewsError("An unexpected error occurred: $e");
//     }
//   }
// }
