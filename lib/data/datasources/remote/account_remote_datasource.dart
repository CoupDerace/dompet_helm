

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

  @override

  Future<List<TransactionModel>> getTransactions() async {
    final response = await _client.get(ApiEndpoints.transactions);
    final list = response['data'] as List<dynamic>;
    return list
        .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}