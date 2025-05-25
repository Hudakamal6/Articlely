import 'package:articlely/features/news/domain/entities/article_source_entity.dart';

class ArticleSourceModel extends ArticleSourceEntity {
  ArticleSourceModel({required super.name});

  factory ArticleSourceModel.fromJson(Map<String, dynamic> json) {
    return ArticleSourceModel(name: json['name']);
  }
}
