import 'package:articlely/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:articlely/features/news/data/data_sources/news_remote_data_source_impl.dart';
import 'package:articlely/features/news/data/repositories/news_repo_impl.dart';
import 'package:articlely/features/news/domain/repositories/news_repo.dart';
import 'package:articlely/features/news/domain/use_cases/get_news_use_case.dart';
import 'package:articlely/features/news/domain/use_cases/launch_url_use_case.dart';
import 'package:articlely/features/news/presentation/manager/categories/categories_cubit.dart';
import 'package:articlely/features/news/presentation/manager/news/news_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../../core/extensions/get_it_extension.dart';

class HomeServices {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely(() => GetNewsUseCase(repo: sl()));
    sl.registerLazySingletonSafely(() => LaunchUrlUseCase());

    sl.registerFactorySafely(
        () => NewsCubit(getNewsUseCase: sl(), launchUrlUseCase: sl()));

    sl.registerFactorySafely(() => CategoryCubit());

    sl.registerLazySingletonSafely<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(dio: sl()),
    );

    sl.registerLazySingletonSafely<NewsRepo>(
      () => NewsRepoImpl(remoteDataSource: sl()),
    );
  }
}
