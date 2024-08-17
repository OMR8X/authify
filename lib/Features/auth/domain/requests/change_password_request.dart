class ChangePasswordRequest {
  final String code;
  final String password;

  ChangePasswordRequest({
    required this.code,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "password": password,
    };
  }
}
