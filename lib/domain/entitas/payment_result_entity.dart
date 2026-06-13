class PaymentResultEntity extends Equatable {
  final String title;
  final String subtitle;
  final double amount;
  final List<List<String>> lines;
  final String kind;
}
