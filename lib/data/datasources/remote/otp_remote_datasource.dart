abstract class OtpRemoteDatasource {
  Future<OtpSentEntity> sendOtpFirebase();
  Future<OtpSentEntity> sendOtpEmail();
  Future<void> confirmOtp({required String code, required String otpType});
  Future<TotpSetupEntity> registerTotp();
  Future<bool> verifyTotp(String code);
}

class OtpRemoteDatasourceImpl implements OtpRemoteDatasource {
  final ApiClient _client;
  OtpRemoteDatasourceImpl(this._client);

  @override
  Future<OtpSentEntity> sendOtpFirebase() async {
    final response = await _client.post(ApiEndpoints.sendOtpFirebase);
    final data = response['data'] as Map<String, dynamic>;
    return OtpSentEntity(
      otpType: data['otp_type'] as String,
      expiresIn: (data['expires_in'] as num).toInt(),
    );
  }

  
}
