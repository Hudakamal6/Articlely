import 'package:articlely/features/sign_up/data/data_sources/remote/sign_up_remote_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/models/auth_model.dart';

class SignUpRemoteDataImpl extends SignUpRemoteData {
  final FirebaseAuth _auth;

  SignUpRemoteDataImpl(this._auth);

  @override
  Future<void> signUp(AuthenticationModel userModel) async {
    await _auth.createUserWithEmailAndPassword(
        email: userModel.userEmail, password: userModel.userPassword);
  }
}
