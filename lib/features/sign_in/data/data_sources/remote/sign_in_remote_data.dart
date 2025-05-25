import '../../../../../core/models/auth_model.dart';

abstract class SignInRemoteData {
  Future<void> signIn(AuthenticationModel userSignInData);

}
