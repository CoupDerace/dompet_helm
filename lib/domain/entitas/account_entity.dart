class AccountEntity extends Equatable {
  final int id;
  final int userId;
  final double balance;
  final DateTime createdAt;

  const AccountEntity({
    required this.id,
    required this.userId,
    required this.balance,
    required this.createdAt,
  });
}
