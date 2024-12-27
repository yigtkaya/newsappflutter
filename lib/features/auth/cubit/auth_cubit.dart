import 'package:newsappflutter/core/cubit/base_cubit.dart';
import 'package:newsappflutter/core/di/dependecy_injection_items.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/auth/data/models/user_model.dart';
import 'package:newsappflutter/features/auth/domain/entities/user_entity.dart';
import 'package:newsappflutter/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:newsappflutter/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:newsappflutter/features/auth/domain/usecases/listen_auth_state_usecase.dart';
import 'package:newsappflutter/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:newsappflutter/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:newsappflutter/features/auth/domain/usecases/sign_up_usecase.dart';

part 'auth_state.dart';

/// Auth cubit.
final class AuthCubit extends BaseCubit<AuthState> {
  /// Constructor for AuthCubit.
  AuthCubit(
    this._signInUsecase,
    this._signUpUsecase,
    this._signOutUsecase,
    this._getCurrentUserUsecase,
    this._listenAuthStateUsecase,
    this._forgotPasswordUsecase,
  ) : super(
          AuthInitial(),
        ) {
    listenToAuthChanges();
  }

  final SignInUsecase _signInUsecase;
  final SignUpUsecase _signUpUsecase;
  final SignOutUsecase _signOutUsecase;
  final GetCurrentUserUsecase _getCurrentUserUsecase;
  final ListenAuthStateUsecase _listenAuthStateUsecase;
  final ForgotPasswordUsecase _forgotPasswordUsecase;

  /// Listen to auth changes
  void listenToAuthChanges() {
    emit(
      AuthLoading(),
    );
    _listenAuthStateUsecase.call().listen((user) {
      if (user != null) {
        emit(AuthSuccess(user: user));
        cacheUser(
          UserEntity(
            user: UserModel(
              id: user.id,
              email: user.email,
              name: user.name,
            ),
          ),
        );
      } else {
        emit(AuthInitial());
        DepInItems.productCache.userCacheOperation.clear();
      }
    });
  }

  /// Get current user.
  Future<void> getCurrentUser() async {
    emit(AuthLoading());
    final result = await _getCurrentUserUsecase.call();
    result.fold(
      (failure) => emit(AuthFailure(failure: failure)),
      (user) => emit(
        AuthSuccess(user: user),
      ),
    );
  }

  /// Sign in with email and password.
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    final result = await _signInUsecase.call(email, password);
    result.fold(
      (failure) => emit(
        AuthFailure(failure: failure),
      ),
      (user) => emit(
        AuthSuccess(user: user),
      ),
    );
  }

  /// Forgot password.
  Future<void> forgotPassword({required String email}) async {
    emit(AuthLoading());
    final result = await _forgotPasswordUsecase.call(email);
    result.fold(
      (failure) => emit(AuthFailure(failure: failure)),
      (user) => emit(
        ForgotPasswordSuccess(),
      ),
    );
  }

  /// Sign out.
  Future<void> signOut() async {
    emit(AuthLoading());

    await _signOutUsecase.call();
    emit(
      AuthInitial(),
    );
  }

  /// Sign up with email and password.
  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(AuthLoading());
    final result = await _signUpUsecase.call(email, password, name);
    result.fold(
      (failure) => emit(
        AuthFailure(failure: failure),
      ),
      (user) => emit(
        AuthSuccess(user: user),
      ),
    );
  }

  /// Cache user.
  Future<void> cacheUser(UserEntity user) async {
    DepInItems.productCache.userCacheOperation.add(
      user,
    );
  }

  /// Get cached user.
  Future<UserModel?> getCachedUser() async {
    // get user from current state
    final user = (state as AuthSuccess).user;
    final userEntity = DepInItems.productCache.userCacheOperation.get(
      user.id,
    );
    return userEntity?.user;
  }
}
