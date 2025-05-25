import 'package:articlely/core/models/auth_model.dart';
import 'package:articlely/features/sign_up/presentation/manager/sign_up_state.dart';

import '../../domain/use_cases/sign_up_use_case.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit(this.signUpUseCase) : super(SignUpInitial());

  Future<void> signUp(AuthenticationModel user) async {
    emit(SignUpLoading());
    try {
      await signUpUseCase(user);
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpError(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
