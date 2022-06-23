class LoggedUser {
  final String email;
  LoggedUser({required this.email});

  factory LoggedUser.empty() {
    return LoggedUser(email: "");
  }
}
