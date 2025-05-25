import 'package:articlely/core/userAuth/domain/usecases/sign_out_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/check_user_auth_usecase.dart';
import 'check_user_auth_state.dart';

class CheckUserAuthCubit extends Cubit<CheckUserAuthState> {
  final CheckUserAuthUseCase checkUserAuthUseCase;
  final SignOutUseCase signOutUseCase;

  CheckUserAuthCubit(this.checkUserAuthUseCase, this.signOutUseCase)
      : super(CheckUserAuthInitial());
  String user = '';

  void checkAuthStatus() {
    try {
      final isLoggedIn = checkUserAuthUseCase();
      if (isLoggedIn != null) {
        user = isLoggedIn;
        emit(UserLoggedIn());
      } else {
        emit(UserNotLoggedIn());
      }
    } catch (_) {
      emit(CheckUserAuthError("Failed to check auth status."));
    }
  }

  Future<void> signOut() async {
    await signOutUseCase.call();
    emit(UserNotLoggedIn());
  }
}
