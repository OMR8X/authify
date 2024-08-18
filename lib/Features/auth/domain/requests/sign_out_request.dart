class SignOutRequest {
  //
  final String token;

  SignOutRequest({
    required this.token,
  });

  Map<String, dynamic> toHeaders() {
    return {
      "Authorization": "Bearer $token",
    };
  }
}
