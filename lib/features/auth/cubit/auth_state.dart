part of 'auth_cubit.dart';

/// State of the auth cubit.
sealed class AuthState extends BaseState {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial state of the auth cubit.
final class AuthInitial extends AuthState {}

/// Forgot password success state of the auth cubit.
final class ForgotPasswordSuccess extends AuthState {}

/// Loading state of the auth cubit.
final class AuthLoading extends AuthState {}

/// Success state of the auth cubit.
final class AuthSuccess extends AuthState {
  /// Constructor for AuthSuccess.
  const AuthSuccess({
    required this.user,
  });

  /// User of the auth cubit.
  final UserModel user;

  @override
  List<Object?> get props => [user];
}

/// Failure state of the auth cubit.
final class AuthFailure extends AuthState {
  /// Constructor for AuthFailure.
  const AuthFailure({required this.failure});

  /// Failure of the auth cubit.
  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
