class TotpSetupEntity extends Equatable {
  final String secret;
  final String qrCode;
  final String issuer;
  final String account;

  const TotpSetupEntity({
    required this.secret,
    required this.qrCode,
    required this.issuer,
    required this.account,
  })
}
