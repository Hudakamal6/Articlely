import '../../../../core/models/auth_model.dart';

abstract class SignInRepo {
  Future<void> signIn(AuthenticationModel userSignInData);
}