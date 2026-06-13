class LogoutUsecase {
  final AuthRepository _repository;
  LogoutUsecase(this._repository);

  Future<void> call() => _repository.logout();
}
