abstract class IAuthException implements Exception {
  final String message;

  IAuthException([this.message = "Auth Exception"]);
}

class InvalidCredentialsException extends IAuthException {
  InvalidCredentialsException(
      [String message = "Invalid credentials, please verify them and retry"])
      : super(message);
}

class UserNotFoundException extends IAuthException {
  UserNotFoundException([String message = "User not found"]) : super(message);
}

class LogoutException extends IAuthException {
  LogoutException([String message = "Unable to log out account"])
      : super(message);
}
