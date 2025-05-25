abstract class AuthRepository {
  String? isUserLoggedIn();
  Future<void> signOut();

}