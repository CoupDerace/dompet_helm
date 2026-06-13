class UserEntity extends Equatable {
  final int id;
  final String firebaseUid;
  final String email;
  final String name;
  final String role;
  final bool emailVerified;
  final bool totpEnabled;
  final String? twoFaMethod;

  const UserEntity({
    required this.id,
    required this.firebaseUid,
    required this.email,
    required this.name,
    required this.role,
    required this.emailVerified,
    required this.totpEnabled,
    this.twoFaMethod,
  });
}
