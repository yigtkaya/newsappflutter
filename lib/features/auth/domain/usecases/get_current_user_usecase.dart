import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/auth/data/models/user_model.dart';
import 'package:newsappflutter/features/auth/domain/repository/auth_repository.dart';

/// Usecase to get current user.
final class GetCurrentUserUsecase {
  /// Constructor for GetCurrentUserUsecase.
  GetCurrentUserUsecase(this._authRepository);

  /// Auth repository.
  final AuthRepository _authRepository;

  /// Get current user.
  Future<Either<Failure, UserModel>> call() async {
    return _authRepository.getCurrentUser();
  }
}
