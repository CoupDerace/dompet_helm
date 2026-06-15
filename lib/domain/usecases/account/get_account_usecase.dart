import 'package:dompet_helm/domain/entities/account_entity.dart';
import 'package:dompet_helm/domain/entities/transaction_entity.dart';
import 'package:dompet_helm/domain/repositories/account_repository.dart';

class GetAccountUsecase {
  final AccountRepository _repository;
  GetAccountUsecase(this._repository);
  Future<AccountEntity> call() => _repository.getAccount();
}

class GetTransactionsUsecase {
  final AccountRepository _repository;
  GetTransactionsUsecase(this._repository);
  Future<List<TransactionEntity>> call() => _repository.getTransactions();
}
