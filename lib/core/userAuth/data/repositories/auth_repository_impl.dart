import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  String? isUserLoggedIn() {
    return _firebaseAuth.currentUser?.email ;
  }
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}