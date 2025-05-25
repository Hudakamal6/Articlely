import 'package:articlely/core/models/auth_model.dart';
import 'package:articlely/features/sign_up/domain/repositories/sign_up_repo.dart';

class SignUpUseCase {
  final SignUpRepo repository;

  SignUpUseCase(this.repository);

  Future<void> call(AuthenticationModel user) async {
    await repository.signUp(user);
  }
}
