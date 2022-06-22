import 'package:wa_pet_app/shared/auth/domain/logged_user.dart';

class LoggedUserAdapter extends LoggedUser {
  LoggedUserAdapter({required String email}) : super(email: email);

  Map<String, dynamic> toMap() {
    return {
      "email": email,
    };
  }

  factory LoggedUserAdapter.fromMap(Map<String, dynamic> source) {
    return LoggedUserAdapter(
      email: source["email"],
    );
  }
}
