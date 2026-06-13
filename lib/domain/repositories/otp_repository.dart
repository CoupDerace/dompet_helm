abstract class OtpRepository {
  Future<OtpSentEntity> sendOtpFirebase();
  Future<OtpSentEntity> sendOtpEmail();
}
