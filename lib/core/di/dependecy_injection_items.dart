import 'package:newsappflutter/core/cache/product_cache.dart';
import 'package:newsappflutter/core/di/dependecy_injection.dart';
import 'package:newsappflutter/features/auth/cubit/auth_cubit.dart';
import 'package:newsappflutter/features/bookmarks/cubit/bookmarks_cubit.dart';
import 'package:newsappflutter/features/home/cubit/all_news/news_cubit.dart';
import 'package:newsappflutter/features/home/cubit/carousel_cubit.dart';
import 'package:newsappflutter/features/home/cubit/top_news/top_news_cubit.dart';
import 'package:newsappflutter/features/root/bottom_navigation_cubit.dart';
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

  static CarouselCubit get carouselCubit => DependencyInjection.read<CarouselCubit>();

  static TopNewsCubit get topNewsCubit => DependencyInjection.read<TopNewsCubit>();

  static BottomNavigationCubit get bottomNavigationCubit => DependencyInjection.read<BottomNavigationCubit>();

  /// Get the bookmarks cubit
  static BookmarksCubit get bookmarksCubit => DependencyInjection.read<BookmarksCubit>();
}
