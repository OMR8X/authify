class SignInRequest {
  //
  final String email;
  final String password;
  final bool keepLoggedIn;

  SignInRequest({
    required this.email,
    required this.password,
    required this.keepLoggedIn,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
