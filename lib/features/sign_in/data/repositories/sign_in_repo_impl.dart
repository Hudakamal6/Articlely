import 'package:articlely/features/sign_in/data/data_sources/remote/sign_in_remote_data.dart';

import '../../../../core/models/auth_model.dart';
import '../../domain/repositories/sign_in_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepoImpl extends SignInRepo {
  final SignInRemoteData remoteDataSource;

  SignInRepoImpl(this.remoteDataSource);

  @override
  Future<void> signIn(AuthenticationModel userSignInData) async {
    try {
      await remoteDataSource.signIn(userSignInData);
    } on FirebaseAuthException catch (e) {
      String message = e.code;
      print(e.code);

      throw Exception(message);
    } catch (e) {
      throw Exception("Something went wrong. Try again.");
    }
  }


}
