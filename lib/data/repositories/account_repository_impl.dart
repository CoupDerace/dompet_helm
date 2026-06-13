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
}
