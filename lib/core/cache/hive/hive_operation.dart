import 'package:hive/hive.dart';
import 'package:newsappflutter/core/cache/core/cache_model.dart';
import 'package:newsappflutter/core/cache/core/cache_operation.dart';

/// Cache operations that uses hive
final class HiveCacheOperation<T extends CacheModel> implements CacheOperation<T> {
  /// Initialize hive box
  HiveCacheOperation() {
    _box = Hive.box<T>(name: T.toString());
  }

  /// The box
  late final Box<T> _box;

  @override
  void add(T item) {
    _box.put(item.id, item);
  }

  @override
  void addAll(List<T> items) {
    _box.putAll(Map.fromIterable(items));
  }

  @override
  void clear() {
    _box.clear();
  }

  @override
  T? get(String id) {
    return _box.get(id);
  }

  @override
  List<T> getAll() {
    return _box.getAll(_box.keys).where((element) => element != null).cast<T>().toList();
  }

  @override
  void remove(String id) {
    _box.delete(id);
  }

  @override
  void removeAll(List<String> ids) {
    _box.deleteAll(ids);
  }

  @override
  void update(T item) {
    _box.put(item.id, item);
  }

  @override
  void updateAll(List<T> items) {
    _box.putAll(Map.fromIterable(items));
  }
}
