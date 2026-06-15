import 'package:dompet_helm/core/error/exceptions.dart';
import 'package:dompet_helm/core/error/failures.dart';
import 'package:dompet_helm/data/datasources/remote/payment_remote_datasource.dart';
import 'package:dompet_helm/domain/entities/payment_result_entity.dart';
import 'package:dompet_helm/domain/repositories/payment_repository.dart';

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
    } on InvalidOtpException catch (e) {
      throw InvalidOtpFailure(e.message);
    } on InsufficientBalanceException catch (e) {
      throw InsufficientBalanceFailure(
        balance: e.balance ?? 0,
        amount: e.amount ?? 0,
        message: e.message,
      );
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } on NetworkException catch (e) {
      throw NetworkFailure(e.message);
    }
  }
}
