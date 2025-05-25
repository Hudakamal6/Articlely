import 'package:articlely/features/news/domain/entities/news_response.dart';
import 'package:articlely/features/news/domain/repositories/news_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class GetNewsUseCase {
  final NewsRepo repo;

  GetNewsUseCase({required this.repo});

  Future<Either<Failure, NewsResponseEntity>> getNews(String url) async {
    return await repo.getNews(url);
  }
}
