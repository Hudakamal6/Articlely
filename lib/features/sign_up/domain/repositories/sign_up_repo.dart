import '../../../../core/models/auth_model.dart';

abstract class SignUpRepo{
  Future<void> signUp(AuthenticationModel userModel);

}