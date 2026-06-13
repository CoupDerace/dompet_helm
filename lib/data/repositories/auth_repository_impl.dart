class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remote;
  final SecureStorageDatasource _local;

  AuthRepositoryImpl(this._remote, this._local);

  
}
