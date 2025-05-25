import 'package:articlely/core/models/auth_model.dart';
import 'package:articlely/features/sign_in/domain/repositories/sign_in_repo.dart';

class SignInUseCase {
  final SignInRepo repository;

  SignInUseCase(this.repository);

  Future<void> call(AuthenticationModel user) async {
    await repository.signIn(user);
  }
}
