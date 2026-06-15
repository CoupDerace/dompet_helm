

import 'package:dompet_helm/domain/entities/user_entity.dart';
import 'package:dompet_helm/domain/repositories/auth_repository.dart';

class VerifyFirebaseTokenUsecase {
  final AuthRepository _repository;
  VerifyFirebaseTokenUsecase(this._repository);

  Future<({UserEntity user, String token})> call(String firebaseToken) {
    return _repository.verifyFirebaseToken(firebaseToken);
  }
}
