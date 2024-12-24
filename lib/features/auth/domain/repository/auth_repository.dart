import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/auth/data/models/user_model.dart';

/// Auth repository interface.
abstract interface class AuthRepository {
  /// Sign in with email and password.
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  /// Sign up with email and password.
  Future<Either<Failure, UserModel>> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  );

  /// Sign out.
  Future<Either<Failure, void>> signOut();

  /// Get current user.
  Future<Either<Failure, UserModel>> getCurrentUser();

  /// Forgot password.
  Future<Either<Failure, void>> forgotPassword(String email);

  /// Listen to auth changes.
  Stream<UserModel?> listenToAuthChanges();
}
