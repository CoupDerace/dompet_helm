

class AccountModel extends AccountEntity {
  const AccountModel({
    required super.id,
    required super.userId,
    required super.balance,
    required super.createdAt,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
    );
  }
}