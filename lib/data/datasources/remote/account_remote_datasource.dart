

abstract class AccountRemoteDatasource {
  Future<AccountModel> getAccount();
  Future<List<TransactionModel>> getTransactions();
}

class AccountRemoteDatasourceImpl implements AccountRemoteDatasource {
  final ApiClient _client;
  AccountRemoteDatasourceImpl(this._client);

  @override
  Future<AccountModel> getAccount() async {
    final response = await _client.get(ApiEndpoints.account);
    return AccountModel.fromJson(response['data'] as Map<String, dynamic>);
  }

  