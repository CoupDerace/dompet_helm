class CurrencyFormatter {
  static final _formatter = NumberFormat('#,###', 'id_ID');

  static String format(double amount, {bool withSymbol = true}) {
    final formatted = _formatter.format(amount.abs().round());
    return withSymbol ? 'Rp$formatted' : formatted;
  }

  
}
