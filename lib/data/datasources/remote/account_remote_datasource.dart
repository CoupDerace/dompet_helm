

abstract class AccountRemoteDatasource {
  Future<AccountModel> getAccount();
  Future<List<TransactionModel>> getTransactions();
}

class AccountRemoteDatasourceImpl implements AccountRemoteDatasource {
  final ApiClient _client;
  AccountRemoteDatasourceImpl(this._client);

  