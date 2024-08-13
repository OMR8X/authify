class ChangePasswordRequest {
  final String code;
  final String newPassword;

  ChangePasswordRequest({
    required this.code,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "password": newPassword,
    };
  }
}
