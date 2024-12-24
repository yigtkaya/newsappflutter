/// Cache model mixin.
mixin CacheModel {
  /// The id of the cache model.
  String get id;

  /// Convert from dynamic json.
  CacheModel fromDynamicJson(dynamic json);

  /// Convert to json.
  Map<String, dynamic> toJson();
}
