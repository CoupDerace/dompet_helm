import 'package:dompet_helm/core/error/exceptions.dart';
import 'package:dompet_helm/core/error/failures.dart';
import 'package:dompet_helm/data/datasources/remote/account_remote_datasource.dart';
import 'package:dompet_helm/domain/entities/account_entity.dart';
import 'package:dompet_helm/domain/entities/transaction_entity.dart';
import 'package:dompet_helm/domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDatasource _remote;
  AccountRepositoryImpl(this._remote);

  @override
  Future<AccountEntity> getAccount() async {
    try {
      return await _remote.getAccount();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } on NetworkException catch (e) {
      throw NetworkFailure(e.message);
    }
  }

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    try {
      return await _remote.getTransactions();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } on NetworkException catch (e) {
      throw NetworkFailure(e.message);
    }
  }
}
