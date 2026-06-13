// Events
abstract class PaymentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaymentTopupRequested extends PaymentEvent {
  final double amount;
  PaymentTopupRequested(this.amount);
  @override
  List<Object?> get props => [amount];
}

class PaymentTransferRequested extends PaymentEvent {
  final double amount;
  final String description;
  final String otpCode;
  final String otpType;
  PaymentTransferRequested({
    required this.amount,
    required this.description,
    required this.otpCode,
    required this.otpType,
  });
  @override
  List<Object?> get props => [amount, description, otpCode, otpType];
}

class PaymentReset extends PaymentEvent {}

// States
abstract class PaymentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentTopupSuccess extends PaymentState {
  final double balance;
  final double amount;
  PaymentTopupSuccess({required this.balance, required this.amount});
  @override
  List<Object?> get props => [balance, amount];
}

class PaymentTransferSuccess extends PaymentState {
  final TransferResultEntity result;
  PaymentTransferSuccess(this.result);
  @override
  List<Object?> get props => [result];
}

class PaymentInvalidOtp extends PaymentState {
  final String message;
  PaymentInvalidOtp(this.message);
  @override
  List<Object?> get props => [message];
}

class PaymentInsufficientBalance extends PaymentState {
  final double balance;
  final double amount;
  PaymentInsufficientBalance({required this.balance, required this.amount});
  @override
  List<Object?> get props => [balance, amount];
}

class PaymentError extends PaymentState {
  final String message;
  PaymentError(this.message);
  @override
  List<Object?> get props => [message];
}

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  
}
