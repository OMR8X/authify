class ApiSettings {
  //
  static const receiveTimeout = 15;
  static const sendTimeout = 15;
  static const connectTimeout = 15;
  //
  static const baseUrl = 'http://127.0.0.1:8000';
  // static const baseUrl = 'https://authify.omr8x.com';
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
  /// auth urls
  static String get signIn => '/api/auth/sign-in';
  static String get signUp => '/api/auth/sign-up';
  static String get signOut => '/api/auth/sign-out';
  static String get changePassword => '/api/auth/change-password';
  static String get forgetPassword => '/api/auth/forget-password';
  static String get getUserData => '/api/auth/get-user-data';
  static String get updateUserData => '/api/auth/update-user-data';
  static String downloadFile(String id) => '/api/files/downland?id=$id';
  static String get uploadFile => '/api/files/downland';
}
