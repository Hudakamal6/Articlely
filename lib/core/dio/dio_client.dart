import 'package:articlely/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient._();

  static Dio? _instance;

  static Dio get instance {
    _instance ??= Dio()
      ..options.baseUrl = Constants.apiBaseUrl
      ..options.connectTimeout = const Duration(seconds: 10000)
      ..options.sendTimeout = const Duration(seconds: 10000)
      ..options.receiveTimeout = const Duration(seconds: 10000)
      ..options.responseType = ResponseType.json
      ..options.headers.addAll(
        {
          Headers.contentTypeHeader: Headers.jsonContentType,
          Headers.acceptHeader: Headers.jsonContentType,
        },
      )
      ..options.receiveDataWhenStatusError = true
      ..options.validateStatus = (_) {
        return true;
      };

//    _addInternetInterceptor();
    _addLogger();

    return _instance!;
  }

  static void _addLogger() {
    if (kDebugMode && _instance != null) {
      _instance!.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }
}
