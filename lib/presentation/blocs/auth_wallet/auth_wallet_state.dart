part of 'auth_wallet_cubit.dart';

abstract class AuthWalletState extends Equatable {
  const AuthWalletState();

  @override
  List<Object> get props => [];
}

class AuthWalletInitial extends AuthWalletState {}

class AuthWalletLoading extends AuthWalletState {}

class AuthLoaded extends AuthWalletState {}

class AuthWalletLoaded extends AuthWalletState {}

class AuthWalletError extends AuthWalletState {
  final String errorMessage;

  const AuthWalletError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
