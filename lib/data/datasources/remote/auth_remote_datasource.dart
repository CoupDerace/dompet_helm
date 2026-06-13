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

  @override
  Future<({UserModel user, String token})> verifyFirebaseToken(String firebaseToken) async {
    final response = await _client.post(
      ApiEndpoints.verifyToken,
      data: {'firebase_token': firebaseToken},
    );
    final data = response['data'] as Map<String, dynamic>;
    final token = data['access_token'] as String;
    final user = UserModel.fromJson(data['user'] as Map<String, dynamic>);
    _client.setAuthToken(token);
    return (user: user, token: token);
  }
}
