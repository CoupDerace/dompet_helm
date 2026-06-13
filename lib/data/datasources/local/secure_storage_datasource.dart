

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