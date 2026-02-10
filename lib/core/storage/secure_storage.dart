import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _token = 'access_token';
  static const _userName = 'name';
  static const _userId = 'id';

  final FlutterSecureStorage _storage;
  SecureStorage(this._storage);

  Future<void> saveResponse({
    required String token,
    required String userName,
    required String userId,
  }) async {
    await _storage.write(key: _token, value: token);
    await _storage.write(key: _userName, value: userName);
    await _storage.write(key: _userId, value: userId);
  }

  Future<String?> getToken() => _storage.read(key: _token);
  Future<String?> getUserId() => _storage.read(key: _userId);
  Future<String?> getUserName() => _storage.read(key: _userName);

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}