import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  // Singleton instance of FlutterSecureStorage
  static const _storage = FlutterSecureStorage();

  // Private constructor
  TokenManager._privateConstructor();

  static final TokenManager instance = TokenManager._privateConstructor();

  // Get token
  Future<String?> getToken() async {
    try {
      return await _storage.read(key: "token");
    } catch (e) {
      return null;
    }
  }

  // Set token
  Future<void> setToken(String token) async {
    await _storage.write(key: "token", value: token);
  }

  // Delete token
  Future<void> deleteToken() async {
    await _storage.delete(key: "token");
  }
}
