class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource _remote;
  final SecureStorageDatasource _local;

  AuthRepositoryImpl(this._remote, this._local);

  @override
  Future<({UserEntity user, String token})> verifyFirebaseToken(String firebaseToken) async {
    try {
      final result = await _remote.verifyFirebaseToken(firebaseToken);
      await _local.saveToken(result.token);
      await _local.saveUserJson(result.user.toJsonString());
      await _local.saveAuthVerified(false);
      return (user: result.user, token: result.token);
    } on UnauthorizedException catch (e) {
      throw AuthFailure(e.message, errorCode: e.errorCode);
    } on ServerException catch (e) {
      throw ServerFailure(e.message, errorCode: e.errorCode);
    } on NetworkException catch (e) {
      throw NetworkFailure(e.message);
    }
  }

  
}
