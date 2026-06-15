import 'package:dompet_helm/domain/entities/otp_entity.dart';

abstract class OtpRepository {
  Future<OtpSentEntity> sendOtpFirebase();
  Future<OtpSentEntity> sendOtpEmail();
  Future<void> confirmOtp({required String code, required String otpType});
  Future<TotpSetupEntity> registerTotp();
  Future<bool> verifyTotp(String code);
}
