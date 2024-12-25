import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';

/// Base Repository
abstract class BaseRepository {
  /// Handle network call
  Future<Either<Failure, T>> handleNetworkCall<T>({
    required Future<T> Function() call,
  }) async {
    try {
      final response = await call();
      return Right(response);
    } on NetworkFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        Failure(
          message: e.toString(),
          code: '000',
        ),
      );
    }
  }
}
