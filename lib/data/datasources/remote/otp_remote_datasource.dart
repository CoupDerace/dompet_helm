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
}
