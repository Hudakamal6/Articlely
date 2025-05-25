import 'package:articlely/features/news/domain/entities/news_response.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponseEntity> getNews(String url );
}
