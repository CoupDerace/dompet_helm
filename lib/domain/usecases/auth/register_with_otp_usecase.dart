import 'package:dompet_helm/domain/entitas/user_entity.dart';
import 'package:dompet_helm/domain/repositories/auth_repository.dart';

class RegisterWithOtpUsecase {
  final AuthRepository _repository;
  RegisterWithOtpUsecase(this._repository);

  Future<({UserEntity user, String token})> call(String firebaseToken) {
    return _repository.registerWithOtp(firebaseToken);
  }
}
