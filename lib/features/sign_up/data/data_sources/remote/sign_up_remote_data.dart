import 'package:articlely/core/models/auth_model.dart';

abstract class SignUpRemoteData{
  Future<void> signUp(AuthenticationModel userModel);

}