

// Events
abstract class OtpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OtpSendFirebase extends OtpEvent {}
class OtpSendEmail extends OtpEvent {}
class OtpConfirm extends OtpEvent {
  final String code;
  final String otpType;
  OtpConfirm({required this.code, required this.otpType});
  @override
  List<Object?> get props => [code, otpType];
}
class OtpRegisterTotp extends OtpEvent {}
class OtpVerifyTotp extends OtpEvent {
  final String code;
  OtpVerifyTotp(this.code);
  @override
  List<Object?> get props => [code];
}
class OtpReset extends OtpEvent {}