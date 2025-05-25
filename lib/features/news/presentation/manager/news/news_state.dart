part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class GetNewsLoading extends NewsState {}

final class EmptyNews extends NewsState {}

final class GetNewsSuccess extends NewsState {
  final List<ArticleEntity> articles;

  final int totalResults;

  GetNewsSuccess({required this.articles, required this.totalResults});
}

final class GetNewsError extends NewsState {
  final String error;

  GetNewsError({required this.error});
}

final class LaunchUrSuccess extends NewsState {}

final class LaunchUrlError extends NewsState {
  final String error;

  LaunchUrlError({required this.error});
}
