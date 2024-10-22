part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class NewsInitial extends HomeState {}

final class NewsLoading extends HomeState {}

final class SourcesLoaded extends HomeState {
  //  List<Sources>? source;
  // SourcesLoaded({required this.source});
}

final class ChangeNewsState extends HomeState {}

final class NewsLoaded extends HomeState {}

final class NewsError extends HomeState {
  final String error;

  NewsError(this.error);
}