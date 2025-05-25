import 'package:articlely/core/userAuth/data/repositories/auth_repository_impl.dart';
import 'package:articlely/core/userAuth/domain/usecases/check_user_auth_usecase.dart';
import 'package:articlely/core/userAuth/presentation/cubit/check_user_auth_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../../core/extensions/get_it_extension.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/sign_out_use_case.dart';

class AuthDi {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely(() => CheckUserAuthUseCase(sl()));
    sl.registerLazySingletonSafely(() => SignOutUseCase(sl()));

    sl.registerFactorySafely(() => CheckUserAuthCubit(
      sl(),sl(),
    ));

    sl.registerLazySingletonSafely<AuthRepository>(
          () => AuthRepositoryImpl(sl()),
    );
  }
}
