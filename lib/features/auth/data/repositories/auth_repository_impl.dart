import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/auth/data/models/user_model.dart';
import 'package:newsappflutter/features/auth/domain/repository/auth_repository.dart';

/// Implementation of the AuthRepository.
final class AuthRepositoryImpl implements AuthRepository {
  /// Constructor for AuthRepositoryImpl.
  AuthRepositoryImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  Future<Either<Failure, UserModel>> getCurrentUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      return Right(
        UserModelMapper.fromJson(
          user!.toString(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      return Left(
        Failure(
          message: e.message ?? 'Get current user failed',
          code: e.code,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(
        UserModel(
          email: userCredential.user!.email ?? '',
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName ?? '',
        ),
      );
    } on FirebaseAuthException catch (e) {
      return Left(
        Failure(
          message: e.message ?? 'Sign in failed',
          code: e.code,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(
        Failure(
          message: e.message ?? 'Sign out failed',
          code: e.code,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      return Right(
        UserModelMapper.fromJson(
          userCredential.user!.toString(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      return Left(
        Failure(
          message: e.message ?? 'Sign up failed',
          code: e.code,
        ),
      );
    }
  }

  @override
  Stream<UserModel?> listenToAuthChanges() {
    return _firebaseAuth.authStateChanges().map((onData) {
      if (onData != null) {
        return UserModel(
          email: onData.email ?? '',
          id: onData.uid,
          name: onData.displayName ?? '',
        );
      }
      return null;
    });
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(
        Failure(
          message: e.message ?? 'Forgot password failed',
          code: e.code,
        ),
      );
    }
  }
}
