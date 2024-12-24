import 'package:newsappflutter/features/auth/data/models/user_model.dart';
import 'package:newsappflutter/features/auth/domain/repository/auth_repository.dart';

/// Usecase to listen to auth state.
final class ListenAuthStateUsecase {
  /// Constructor for ListenAuthStateUsecase.
  ListenAuthStateUsecase(this._authRepository);

  /// Auth repository.
  final AuthRepository _authRepository;

  /// Listen to auth state.
  Stream<UserModel?> call() {
    return _authRepository.listenToAuthChanges();
  }
}
