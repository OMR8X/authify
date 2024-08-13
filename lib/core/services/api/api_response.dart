class ApiResponse {
  //
  final int statusCode;
  final String message;
  //
  final Map<String, dynamic> data;
  //
  ApiResponse({
    required this.data,
    required this.message,
    required this.statusCode,
  });
}
