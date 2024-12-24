import 'package:hive/hive.dart';
import 'package:newsappflutter/core/cache/core/cache_manager.dart';
import 'package:newsappflutter/core/cache/core/cache_model.dart';
import 'package:path_provider/path_provider.dart';

/// Hive manager class.
final class HiveManager implements CacheManager {
  /// Constructor for HiveManager.
  HiveManager({this.path});

  /// The path to the cache
  @override
  final String? path;
  @override
  void clear() {
    Hive.deleteAllBoxesFromDisk();
  }

  @override
  Future<void> init({required List<CacheModel> cacheModels}) async {
    final documentPath = path ?? (await getApplicationDocumentsDirectory()).path;
    Hive.defaultDirectory = documentPath;

    for (final cacheModel in cacheModels) {
      Hive.registerAdapter(
        '${cacheModel.runtimeType}',
        cacheModel.fromDynamicJson,
      );
    }
  }
}
