// Events
abstract class AccountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccountLoadRequested extends AccountEvent {}

class AccountRefreshRequested extends AccountEvent {}

abstract class AccountState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final AccountEntity account;
  final List<TransactionEntity> transactions;
  AccountLoaded({required this.account, required this.transactions});
  @override
  List<Object?> get props => [account, transactions];
}

class AccountError extends AccountState {
  final String message;
  AccountError(this.message);
  @override
  List<Object?> get props => [message];
}

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  
}
