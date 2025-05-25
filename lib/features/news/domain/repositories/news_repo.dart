import '../../../../core/error/failure.dart';
import '../entities/news_response.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepo  {
  Future<Either<Failure, NewsResponseEntity>> getNews(String url);

}