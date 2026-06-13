class PaymentResultEntity extends Equatable {
  final String title;
  final String subtitle;
  final double amount;
  final List<List<String>> lines;
  final String kind;

  const PaymentResultEntity({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.lines,
    required this.kind,
  });
}
