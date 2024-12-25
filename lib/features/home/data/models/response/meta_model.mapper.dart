// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'meta_model.dart';

class MetaMapper extends ClassMapperBase<Meta> {
  MetaMapper._();

  static MetaMapper? _instance;
  static MetaMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MetaMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Meta';

  static int _$found(Meta v) => v.found;
  static const Field<Meta, int> _f$found = Field('found', _$found);
  static int _$returned(Meta v) => v.returned;
  static const Field<Meta, int> _f$returned = Field('returned', _$returned);
  static int _$limit(Meta v) => v.limit;
  static const Field<Meta, int> _f$limit = Field('limit', _$limit);
  static int _$page(Meta v) => v.page;
  static const Field<Meta, int> _f$page = Field('page', _$page);

  @override
  final MappableFields<Meta> fields = const {
    #found: _f$found,
    #returned: _f$returned,
    #limit: _f$limit,
    #page: _f$page,
  };

  static Meta _instantiate(DecodingData data) {
    return Meta(
        found: data.dec(_f$found), returned: data.dec(_f$returned), limit: data.dec(_f$limit), page: data.dec(_f$page));
  }

  @override
  final Function instantiate = _instantiate;

  static Meta fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Meta>(map);
  }

  static Meta fromJson(String json) {
    return ensureInitialized().decodeJson<Meta>(json);
  }
}

mixin MetaMappable {
  String toJson() {
    return MetaMapper.ensureInitialized().encodeJson<Meta>(this as Meta);
  }

  Map<String, dynamic> toMap() {
    return MetaMapper.ensureInitialized().encodeMap<Meta>(this as Meta);
  }

  MetaCopyWith<Meta, Meta, Meta> get copyWith => _MetaCopyWithImpl(this as Meta, $identity, $identity);
  @override
  String toString() {
    return MetaMapper.ensureInitialized().stringifyValue(this as Meta);
  }

  @override
  bool operator ==(Object other) {
    return MetaMapper.ensureInitialized().equalsValue(this as Meta, other);
  }

  @override
  int get hashCode {
    return MetaMapper.ensureInitialized().hashValue(this as Meta);
  }
}

extension MetaValueCopy<$R, $Out> on ObjectCopyWith<$R, Meta, $Out> {
  MetaCopyWith<$R, Meta, $Out> get $asMeta => $base.as((v, t, t2) => _MetaCopyWithImpl(v, t, t2));
}

abstract class MetaCopyWith<$R, $In extends Meta, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? found, int? returned, int? limit, int? page});
  MetaCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MetaCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Meta, $Out> implements MetaCopyWith<$R, Meta, $Out> {
  _MetaCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Meta> $mapper = MetaMapper.ensureInitialized();
  @override
  $R call({int? found, int? returned, int? limit, int? page}) => $apply(FieldCopyWithData({
        if (found != null) #found: found,
        if (returned != null) #returned: returned,
        if (limit != null) #limit: limit,
        if (page != null) #page: page
      }));
  @override
  Meta $make(CopyWithData data) => Meta(
      found: data.get(#found, or: $value.found),
      returned: data.get(#returned, or: $value.returned),
      limit: data.get(#limit, or: $value.limit),
      page: data.get(#page, or: $value.page));

  @override
  MetaCopyWith<$R2, Meta, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _MetaCopyWithImpl($value, $cast, t);
}
