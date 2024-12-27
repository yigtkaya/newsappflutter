import 'package:newsappflutter/core/cache/core/cache_manager.dart';
import 'package:newsappflutter/core/cache/hive/hive_operation.dart';
import 'package:newsappflutter/features/auth/domain/entities/user_entity.dart';
import 'package:newsappflutter/features/bookmarks/domain/entities/bookmarked_news_entity.dart';
import 'package:newsappflutter/features/home/domain/entities/news_entity.dart';

/// ProductCache is a class that manages the cache for the app.
final class ProductCache {
  /// Constructor for ProductCache.
  ProductCache({
    required CacheManager cacheManager,
  }) : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  /// Initialize the cache.
  Future<void> init() async {
    await _cacheManager.init(
      cacheModels: [
        UserEntity.empty(),
        NewsEntity.empty(),
        BookmarkedNewsEntity.empty(),
      ],
    );
  }

  /// User cache operation.
  late final userCacheOperation = HiveCacheOperation<UserEntity>();
  late final newsCacheOperation = HiveCacheOperation<NewsEntity>();
  late final topNewsCacheOperation = HiveCacheOperation<NewsEntity>();
  late final bookmarkedNewsCacheOperation = HiveCacheOperation<BookmarkedNewsEntity>();
}
