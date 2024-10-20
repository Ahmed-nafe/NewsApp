part of 'news__cubit.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class SourcesLoaded extends NewsState {
  List<Sources> source;
  SourcesLoaded({required this.source});
}

final class NewsError extends NewsState {
  final String error;

  NewsError(this.error);
}

// final class NewsLoaded extends NewsState {
//   List<Articles> sources;
//   NewsLoaded({required this.sources});
// }
//
// final class NewsLoading extends NewsState {}
//
// final class NewsError extends NewsState {
//   final String error;
//   NewsError(this.error);
// }
