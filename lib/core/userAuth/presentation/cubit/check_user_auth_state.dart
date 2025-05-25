abstract class CheckUserAuthState {}

class CheckUserAuthInitial extends CheckUserAuthState {}

class UserLoggedIn extends CheckUserAuthState {}

class UserNotLoggedIn extends CheckUserAuthState {}

class CheckUserAuthError extends CheckUserAuthState {
  final String message;

  CheckUserAuthError(this.message);
}

