import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:newsappflutter/core/cache/hive/hive_manager.dart';
import 'package:newsappflutter/core/cache/product_cache.dart';
import 'package:newsappflutter/features/auth/cubit/auth_cubit.dart';
import 'package:newsappflutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:newsappflutter/features/auth/domain/repository/auth_repository.dart';
import 'package:newsappflutter/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:newsappflutter/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:newsappflutter/features/auth/domain/usecases/listen_auth_state_usecase.dart';
import 'package:newsappflutter/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:newsappflutter/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:newsappflutter/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:newsappflutter/localization/cubit/language_cubit.dart';

/// Dependency injection class.
final class DependencyInjection {
  const DependencyInjection._();

  static final _getIt = GetIt.I;

  /// Setup the dependency injection.
  static void setup() {
    _getIt.registerSingleton(
      ProductCache(
        cacheManager: HiveManager(),
      ),
    );

    authSetup();
    languageSetup();
  }

  /// Setup the authentication dependency injection.
  static void authSetup() {
    // Register Firebase Auth instance
    _getIt
      ..registerLazySingleton(() => FirebaseAuth.instance)

      // Register Repository
      ..registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(_getIt()),
      )

      // Register Use Cases
      ..registerLazySingleton(() => SignInUsecase(_getIt()))
      ..registerLazySingleton(() => SignUpUsecase(_getIt()))
      ..registerLazySingleton(() => SignOutUsecase(_getIt()))
      ..registerLazySingleton(() => GetCurrentUserUsecase(_getIt()))
      ..registerLazySingleton(() => ListenAuthStateUsecase(_getIt()))
      ..registerLazySingleton(() => ForgotPasswordUsecase(_getIt()))
      // Register Cubit
      ..registerLazySingleton(
        () => AuthCubit(
          _getIt(), // SignInUsecase
          _getIt(), // SignUpUsecase
          _getIt(), // SignOutUsecase
          _getIt(), // GetCurrentUserUsecase
          _getIt(), // ListenAuthStateUsecase
          _getIt(), // ForgotPasswordUsecase
        ),
      );
  }

  /// Setup the language dependency injection.
  static void languageSetup() {
    _getIt.registerLazySingleton(LanguageCubit.new);
  }

  /// Read an object from the dependency injection.
  static T read<T extends Object>() => _getIt<T>();
}
