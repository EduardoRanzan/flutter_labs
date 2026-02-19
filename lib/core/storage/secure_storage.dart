import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final SecureStorage _instance = SecureStorage._internal();

  factory SecureStorage() {
    return _instance;
  }

  final FlutterSecureStorage _storage;

  SecureStorage._internal()
      : _storage = const FlutterSecureStorage();

  static const _token = 'access_token';
  static const _refreshToken = 'refresh_token';
  static const _expiresAt = 'expires_at';
  static const _userName = 'name';
  static const _userId = 'id';

  Future<void> saveResponse({
    required String token,
    required String refreshToken,
    required int expiresAt,
    required String userName,
    required String userId,
  }) async {
    await _storage.write(key: _token, value: token);
    await _storage.write(key: _refreshToken, value: refreshToken);
    await _storage.write(key: _expiresAt, value: expiresAt.toString());
    await _storage.write(key: _userName, value: userName);
    await _storage.write(key: _userId, value: userId);
  }

  Future<String?> getToken() => _storage.read(key: _token);
  Future<String?> getRefreshToken() => _storage.read(key: _refreshToken);
  Future<int?> getExpiresAt() async {
    final value = await _storage.read(key: _expiresAt);
    if (value == null) return null;

    return int.tryParse(value);
  }
  Future<String?> getUserId() => _storage.read(key: _userId);
  Future<String?> getUserName() => _storage.read(key: _userName);

  Future<void> clear() => _storage.deleteAll();
}
