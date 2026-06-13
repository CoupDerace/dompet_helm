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

// States
abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserEntity user;
  AuthAuthenticated(this.user);
  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

class AuthNeedsVerification extends AuthState {
  final UserEntity user;
  final String token;
  AuthNeedsVerification(this.user, this.token);
  @override
  List<Object?> get props => [user, token];
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
  @override
  List<Object?> get props => [message];
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  
}
