abstract class AccountRepository {
  Future<AccountEntity> getAccount();
  Future<List<TransactionEntity>> getTransactions();
}
