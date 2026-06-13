class GetMeUsecase {
  final AuthRepository _repository;
  GetMeUsecase(this._repository);

  Future<UserEntity> call() => _repository.getMe();
}
