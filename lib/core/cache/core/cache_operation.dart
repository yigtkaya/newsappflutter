import 'package:newsappflutter/core/cache/core/cache_model.dart';

/// Cache operations interface.
abstract interface class CacheOperation<T extends CacheModel> {
  /// Add an item to the cache.
  void add(T item);

  /// Add multiple items to the cache.
  void addAll(List<T> items);

  /// Remove an item from the cache.
  void remove(String id);

  /// Remove multiple items from the cache.
  void removeAll(List<String> ids);

  /// Update an item in the cache.
  void update(T item);

  /// Update multiple items in the cache.
  void updateAll(List<T> items);

  /// Get an item from the cache.
  T? get(String id);

  /// Get all items from the cache.
  List<T> getAll();

  /// Clear the cache.
  void clear();
}
