
import 'articles_entity.dart';

class NewsResponseEntity {
  final String status;
  final int totalResults;
  final List<ArticleEntity> articles;

  const NewsResponseEntity({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
}
