abstract class AuthRepository {
  Future<({UserEntity user, String token})> verifyFirebaseToken(String firebaseToken);
}
