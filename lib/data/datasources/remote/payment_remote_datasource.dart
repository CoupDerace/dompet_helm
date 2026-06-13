abstract class PaymentRemoteDatasource {
  Future<({double balance, double amount})> topup(double amount);
  Future<TransferResultEntity> transfer({
    required double amount,
    required String description,
    required String otpCode,
    required String otpType,
  });
}

class PaymentRemoteDatasourceImpl implements PaymentRemoteDatasource {
  final ApiClient _client;
  PaymentRemoteDatasourceImpl(this._client);

}
