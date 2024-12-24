import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/auth/data/models/user_model.dart';
import 'package:newsappflutter/features/auth/domain/repository/auth_repository.dart';

/// Sign up usecase class.
final class SignUpUsecase {
  /// Constructor for SignUpUsecase.
  SignUpUsecase(this.repository);

  /// Auth repository.
  final AuthRepository repository;

  /// Sign up with email and password.
  Future<Either<Failure, UserModel>> call(
    String email,
    String password,
    String name,
  ) async {
    return repository.signUpWithEmailAndPassword(email, password, name);
  }
}
