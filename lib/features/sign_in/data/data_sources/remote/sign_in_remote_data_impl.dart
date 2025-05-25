import 'package:articlely/features/sign_in/data/data_sources/remote/sign_in_remote_data.dart';
import '../../../../../core/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRemoteDataImpl extends SignInRemoteData {
  final FirebaseAuth firebaseAuth;

  SignInRemoteDataImpl({required this.firebaseAuth});

  @override
  Future<void> signIn(AuthenticationModel userSignInData) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: userSignInData.userEmail,
      password: userSignInData.userPassword,
    );
  }


}
