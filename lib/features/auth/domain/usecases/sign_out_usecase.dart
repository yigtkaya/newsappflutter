import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/auth/domain/repository/auth_repository.dart';

/// Sign out usecase class.
final class SignOutUsecase {
  /// Constructor for SignOutUsecase.
  SignOutUsecase(this.repository);

  /// Auth repository.
  final AuthRepository repository;

  /// Sign out.
  Future<Either<Failure, void>> call() async {
    return repository.signOut();
  }
}
