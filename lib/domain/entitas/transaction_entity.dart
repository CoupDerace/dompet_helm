enum TransactionType { credit, debit }

class TransactionEntity extends Equatable {
  final int id;
  final int accountId;
  final double amount;
  final TransactionType type;
  final String description;
  final double balanceBefore;
  final double balanceAfter;
  final DateTime createdAt;

  
}
