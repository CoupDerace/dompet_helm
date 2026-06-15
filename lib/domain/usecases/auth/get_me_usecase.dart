import 'package:dompet_helm/domain/entitas/user_entity.dart';
import 'package:dompet_helm/domain/repositories/auth_repository.dart';

class GetMeUsecase {
  final AuthRepository _repository;
  GetMeUsecase(this._repository);

  Future<UserEntity> call() => _repository.getMe();
}
