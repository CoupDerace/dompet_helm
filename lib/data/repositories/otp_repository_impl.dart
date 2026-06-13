class OtpRepositoryImpl implements OtpRepository {
  final OtpRemoteDatasource _remote;
  final AuthRepository _authRepo;
  OtpRepositoryImpl(this._remote, this._authRepo);

  @override
  Future<OtpSentEntity> sendOtpFirebase() async {
    try {
      return await _remote.sendOtpFirebase();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } on NetworkException catch (e) {
      throw NetworkFailure(e.message);
    }
  }
}
