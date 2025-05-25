import 'package:articlely/core/models/auth_model.dart';
import 'package:articlely/features/sign_up/data/data_sources/remote/sign_up_remote_data.dart';

import '../../domain/repositories/sign_up_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepoImpl extends SignUpRepo {
  final SignUpRemoteData remoteDataSource;

  SignUpRepoImpl(this.remoteDataSource);

  @override
  Future<void> signUp(AuthenticationModel userModel) async {
    try {
      await remoteDataSource.signUp(userModel);
    } on FirebaseAuthException catch (e) {
      throw Exception(_mapFirebaseError(e.code));
    }
  }

  String _mapFirebaseError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Email already in use';
      case 'invalid-email':
        return 'Invalid email format';
      case 'weak-password':
        return 'Password must be at least 6 characters';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled';
      default:
        return 'Something went wrong';
    }
  }
}
