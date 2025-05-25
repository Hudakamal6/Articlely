import 'package:articlely/features/sign_in/data/data_sources/remote/sign_in_remote_data.dart';
import 'package:articlely/features/sign_in/data/data_sources/remote/sign_in_remote_data_impl.dart';
import 'package:articlely/features/sign_in/data/repositories/sign_in_repo_impl.dart';
import 'package:articlely/features/sign_in/domain/repositories/sign_in_repo.dart';
import 'package:articlely/features/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'package:articlely/features/sign_in/presentation/manager/sign_in_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../../core/extensions/get_it_extension.dart';

class SignInDi {
  final sl = GetIt.instance;

  Future<void> initDi() async {

    sl.registerLazySingletonSafely(() => SignInUseCase(sl()));

    sl.registerFactorySafely(() => SignInCubit(
          sl(),
        ));

    sl.registerLazySingletonSafely<SignInRemoteData>(
      () => SignInRemoteDataImpl(firebaseAuth: sl()),
    );

    sl.registerLazySingletonSafely<SignInRepo>(
      () => SignInRepoImpl(sl()),
    );
  }
}
