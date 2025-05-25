import 'package:articlely/features/news/domain/entities/articles_entity.dart';
import 'package:articlely/features/news/domain/use_cases/get_news_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final GetNewsUseCase getNewsUseCase;
  List<ArticleEntity> _allArticles = [];

  NewsCubit({
    required this.getNewsUseCase,
  }) : super(NewsInitial());

  Future<void> getNews(String url) async {
    emit(GetNewsLoading());

    final result = await getNewsUseCase.getNews(url);

    result.fold(
      (failure) => emit(GetNewsError(error: failure.message)),
      (news) {
        _allArticles = news.articles;
        if (news.articles.isNotEmpty) {
          emit(GetNewsSuccess(
              articles: _allArticles, totalResults: news.totalResults));
        } else {
          emit(EmptyNews());
        }
      },
    );
  }
}
