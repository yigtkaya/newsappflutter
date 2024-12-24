import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/auth/data/models/user_model.dart';
import 'package:newsappflutter/features/auth/domain/repository/auth_repository.dart';

/// Sign in usecase class.
final class SignInUsecase {
  /// Constructor for SignInUsecase.
  SignInUsecase(this.repository);

  /// Auth repository.
  final AuthRepository repository;

  /// Sign in with email and password.
  Future<Either<Failure, UserModel>> call(String email, String password) async {
    return repository.signInWithEmailAndPassword(email, password);
  }
}
