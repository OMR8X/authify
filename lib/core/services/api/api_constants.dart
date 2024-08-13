class ApiSettings {
  //
  static const receiveTimeout = 15;
  static const sendTimeout = 15;
  static const connectTimeout = 15;
  //
  static const baseUrl = 'https://huldrs.com';
  //
}

class ApiHeaders {
  /// keys
  static const headerAuthorizationKey = 'authorization';
  static const headerContentTypeKey = 'content-type';
  static const headerAcceptKey = 'accept';
  static const headerApiKey = 'api-key';
  // values
  static const headerContentTypeJson = 'application/json';
  static const headerAuthorizationBarer = 'barer';
}

class ApiUris {
  /// base url

  /// sign in
  static String get signIn => '/api/sign-in';
  static String get signUp => '/api/sign-in';
  static String get signOut => '/api/sign-in';
  static String get changePassword => '/api/change-password';
  static String get forgetPassword => '/api/forget-password';
}
