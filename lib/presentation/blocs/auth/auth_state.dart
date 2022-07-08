part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final String username;
  final String email;

  const AuthLoaded({required this.username, required this.email});
  @override
  List<Object> get props => [username, email];
}

class AuthError extends AuthState {
  final String errorType;

  const AuthError(this.errorType);

  @override
  List<Object> get props => [errorType];
}

class AuthLogoutLoaded extends AuthState {}
