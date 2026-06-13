abstract class AuthRemoteDatasource {
  Future<({UserModel user, String token})> verifyFirebaseToken(
    String firebaseToken,
  );
  Future<({UserModel user, String token})> registerWithOtp(
    String firebaseToken,
  );
  Future<void> verifyEmailOtp(String code);
  Future<UserModel> getMe();
  Future<void> updateFcmToken(String fcmToken);
  void clearAuthToken();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiClient _client;
  AuthRemoteDatasourceImpl(this._client);


}
