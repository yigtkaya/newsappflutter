import 'package:newsappflutter/core/cache/core/cache_model.dart';

/// A manager for the cache
abstract interface class CacheManager {
  CacheManager({this.path});

  /// Initialize the cache manager
  Future<void> init({required List<CacheModel> cacheModels});

  /// Clear the cache
  void clear();

  /// The path to the cache
  final String? path;
}
