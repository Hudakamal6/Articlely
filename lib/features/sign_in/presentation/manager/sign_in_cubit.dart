import 'package:articlely/core/models/auth_model.dart';
import 'package:articlely/features/sign_in/domain/use_cases/sign_in_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase signInUseCase;
   String userEmail = '';
  SignInCubit(this.signInUseCase, ) : super(SignInInitial());

  Future<void> signIn(AuthenticationModel user) async {
    emit(SignInLoading());
    try {
      await signInUseCase(user);
      userEmail = user.userEmail ;
      emit(SignInSuccess());
    } catch (e) {
      emit(SignInError(e.toString().replaceFirst("Exception: ", "")));
    }
  }


}
