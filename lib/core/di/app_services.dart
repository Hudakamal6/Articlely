import 'package:articlely/core/extensions/get_it_extension.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../navBar/presentation/manager/nav_bar_cubit.dart';

class AppServices {
  final sl = GetIt.instance;

  Future<void> init() async {
    sl.registerFactorySafely<NavBarCubit>(() => NavBarCubit());
    sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  }
}
