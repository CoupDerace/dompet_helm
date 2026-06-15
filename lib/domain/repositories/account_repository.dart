import 'package:dompet_helm/domain/entitas/account_entity.dart';
import 'package:dompet_helm/domain/entitas/transaction_entity.dart';

abstract class AccountRepository {
  Future<AccountEntity> getAccount();
  Future<List<TransactionEntity>> getTransactions();
}
