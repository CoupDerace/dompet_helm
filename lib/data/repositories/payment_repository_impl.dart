class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDatasource _remote;
  PaymentRepositoryImpl(this._remote);

  @override
  Future<({double balance, double amount})> topup(double amount) async {
    try {
      return await _remote.topup(amount);
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } on NetworkException catch (e) {
      throw NetworkFailure(e.message);
    }
  }

  @override
  Future<TransferResultEntity> transfer({
    required double amount,
    required String description,
    required String otpCode,
    required String otpType,
  }) async {
    try {
      return await _remote.transfer(
        amount: amount,
        description: description,
        otpCode: otpCode,
        otpType: otpType,
      );
}
