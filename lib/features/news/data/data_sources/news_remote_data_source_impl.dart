import 'package:articlely/core/error/failure.dart';
import 'package:articlely/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:articlely/features/news/domain/entities/news_response.dart';
import 'package:dio/dio.dart';

import '../models/news_response_model.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<NewsResponseEntity> getNews(String url) async {
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return NewsResponseModel.fromJson(response.data);
      } else {
        final message = response.data['message'] ?? 'Unknown error occurred';
        throw  ServerFailure('Unexpected error: $message');
      }
    } on DioException {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
