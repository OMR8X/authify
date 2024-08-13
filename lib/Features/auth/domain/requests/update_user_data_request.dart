class UpdateUserDataRequest {
  final String name;
  final String email;

  UpdateUserDataRequest({
    required this.name,
    required this.email,
  });
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
    };
  }
}
