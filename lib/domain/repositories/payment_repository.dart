abstract class PaymentRepository {
  Future<({double balance, double amount})> topup(double amount);
  
}
