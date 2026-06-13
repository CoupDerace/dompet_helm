

class SendOtpFirebaseUsecase {
  final OtpRepository _repository;
  SendOtpFirebaseUsecase(this._repository);
  Future<OtpSentEntity> call() => _repository.sendOtpFirebase();
}