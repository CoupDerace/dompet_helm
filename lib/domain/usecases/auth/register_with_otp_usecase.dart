class RegisterWithOtpUsecase {
  final AuthRepository _repository;
  RegisterWithOtpUsecase(this._repository);

  Future<({UserEntity user, String token})> call(String firebaseToken) {
    return _repository.registerWithOtp(firebaseToken);
  }
}
