import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/auth/domain/repository/auth_repository.dart';

/// Forgot password usecase.
final class ForgotPasswordUsecase {
  /// Constructor for ForgotPasswordUsecase.
  ForgotPasswordUsecase(this._authRepository);

  final AuthRepository _authRepository;

  /// Forgot password.
  Future<Either<Failure, void>> call(String email) async {
    return _authRepository.forgotPassword(email);
  }
}
