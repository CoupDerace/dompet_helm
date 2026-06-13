

abstract class SecureStorageDatasource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
  Future<void> save2faMethod(String method);
  Future<String?> get2faMethod();
  Future<void> saveUserJson(String json);
  Future<String?> getUserJson();
  Future<void> saveAuthVerified(bool verified);
  Future<bool> getAuthVerified();
  Future<void> clearAll();
}

class SecureStorageDatasourceImpl implements SecureStorageDatasource {
  final FlutterSecureStorage _storage;

  SecureStorageDatasourceImpl(this._storage);

  @override
  Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: AppConstants.kJwtToken, value: token);
    } catch (_) {
      throw const CacheException('Gagal menyimpan token.');
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      return await _storage.read(key: AppConstants.kJwtToken);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: AppConstants.kJwtToken);
  }

  Future<void> save2faMethod(String method) async {
    await _storage.write(key: AppConstants.k2faMethod, value: method);
  }

  @override
  Future<String?> get2faMethod() async {
    return _storage.read(key: AppConstants.k2faMethod);
  }

  Future<void> saveUserJson(String json) async {
    await _storage.write(key: AppConstants.kUserData, value: json);
  }

  @override
  Future<String?> getUserJson() async {
    return _storage.read(key: AppConstants.kUserData);
  }