import 'package:articlely/features/news/data/data_sources/news_remote_data_source.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/news_response.dart';
import '../../domain/repositories/news_repo.dart';
import 'package:dartz/dartz.dart';

class NewsRepoImpl implements NewsRepo {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, NewsResponseEntity>> getNews(String url) async {
    try {
      final result = await remoteDataSource.getNews(url);
      return Right(result);
    }  catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
