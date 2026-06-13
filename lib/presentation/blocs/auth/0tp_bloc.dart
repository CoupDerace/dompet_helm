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

// States
abstract class OtpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSent extends OtpState {
  final OtpSentEntity entity;
  OtpSent(this.entity);
  @override
  List<Object?> get props => [entity];
}

class OtpVerified extends OtpState {}

class OtpTotpSetup extends OtpState {
  final TotpSetupEntity entity;
  OtpTotpSetup(this.entity);
  @override
  List<Object?> get props => [entity];
}

class OtpTotpEnabled extends OtpState {}

class OtpInvalid extends OtpState {
  final String message;
  OtpInvalid(this.message);
  @override
  List<Object?> get props => [message];
}

class OtpError extends OtpState {
  final String message;
  OtpError(this.message);
  @override
  List<Object?> get props => [message];
}

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  
}
