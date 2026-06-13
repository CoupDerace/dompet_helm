

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