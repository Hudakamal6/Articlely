import 'package:articlely/features/sign_up/data/data_sources/remote/sign_up_remote_data.dart';
import 'package:articlely/features/sign_up/data/data_sources/remote/sign_up_remote_data_impl.dart';
import 'package:articlely/features/sign_up/data/repositories/sign_up_repo_impl.dart';
import 'package:articlely/features/sign_up/domain/repositories/sign_up_repo.dart';
import 'package:articlely/features/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:articlely/features/sign_up/presentation/manager/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../../core/extensions/get_it_extension.dart';

class SignUpDi {
  final sl = GetIt.instance;

  Future<void> initDi() async {
    sl.registerLazySingletonSafely(() => SignUpUseCase(sl()));

    sl.registerFactorySafely(() => SignUpCubit(
          sl(),
        ));

    sl.registerLazySingletonSafely<SignUpRemoteData>(
      () => SignUpRemoteDataImpl(sl()),
    );

    sl.registerLazySingletonSafely<SignUpRepo>(
      () => SignUpRepoImpl(sl()),
    );
  }
}
