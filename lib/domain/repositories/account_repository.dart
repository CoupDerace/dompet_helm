import 'package:dompet_helm/domain/entities/account_entity.dart';
import 'package:dompet_helm/domain/entities/transaction_entity.dart';

abstract class AccountRepository {
  Future<AccountEntity> getAccount();
  Future<List<TransactionEntity>> getTransactions();
}
