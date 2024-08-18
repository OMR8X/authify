class GetUserDataRequest {
  final String token;

  GetUserDataRequest({
    required this.token,
  });
  Map<String, dynamic> toHeaders() {
    return {
      "Authorization": "Bearer $token",
    };
  }
}
