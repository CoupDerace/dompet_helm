

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.firebaseUid,
    required super.email,
    required super.name,
    required super.role,
    required super.emailVerified,
    required super.totpEnabled,
    super.twoFaMethod,
  });

  