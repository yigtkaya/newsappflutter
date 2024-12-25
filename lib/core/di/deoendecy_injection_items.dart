import 'package:newsappflutter/core/cache/product_cache.dart';
import 'package:newsappflutter/core/di/dependecy_injection.dart';
import 'package:newsappflutter/features/home/cubit/news_cubit.dart';
import 'package:newsappflutter/features/auth/cubit/auth_cubit.dart';
import 'package:newsappflutter/localization/cubit/language_cubit.dart';

/// Dependency injection items class.
final class DepInItems {
  const DepInItems._();

  /// Get the product cache.
  static ProductCache get productCache => DependencyInjection.read<ProductCache>();

  /// Get the language cubit.
  static LanguageCubit get languageCubit => DependencyInjection.read<LanguageCubit>();

  /// Get the auth cubit.
  static AuthCubit get authCubit => DependencyInjection.read<AuthCubit>();

  static NewsCubit get newsCubit => DependencyInjection.read<NewsCubit>();
}
