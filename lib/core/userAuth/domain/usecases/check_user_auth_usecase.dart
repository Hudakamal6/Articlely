import '../repositories/auth_repository.dart';

class CheckUserAuthUseCase {
  final AuthRepository repository;

  CheckUserAuthUseCase(this.repository);

  String? call() {
    return repository.isUserLoggedIn();
  }
}