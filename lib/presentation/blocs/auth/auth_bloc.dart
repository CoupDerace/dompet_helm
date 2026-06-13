

// Events
abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthCheckRequested extends AuthEvent {}
class AuthLoginWithFirebase extends AuthEvent {
  final String firebaseToken;
  AuthLoginWithFirebase(this.firebaseToken);
  @override
  List<Object?> get props => [firebaseToken];
}
class AuthLogoutRequested extends AuthEvent {}
class AuthUpdateFcmToken extends AuthEvent {
  final String fcmToken;
  AuthUpdateFcmToken(this.fcmToken);
  @override
  List<Object?> get props => [fcmToken];
}