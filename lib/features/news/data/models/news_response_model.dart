import '../../domain/entities/news_response.dart';
import 'article_model.dart';

class NewsResponseModel extends NewsResponseEntity {
  const NewsResponseModel({
    required super.status,
    required super.totalResults,
    required List<ArticleModel> articles,
  }) : super(articles: articles);

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) {
    return NewsResponseModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: (json['articles'] as List)
          .map((e) => ArticleModel.fromJson(e))
          .toList(),
    );
  }


}
