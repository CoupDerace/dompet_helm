

class SendOtpFirebaseUsecase {
  final OtpRepository _repository;
  SendOtpFirebaseUsecase(this._repository);
  Future<OtpSentEntity> call() => _repository.sendOtpFirebase();
}

class SendOtpEmailUsecase {
  final OtpRepository _repository;
  SendOtpEmailUsecase(this._repository);
  Future<OtpSentEntity> call() => _repository.sendOtpEmail();
}