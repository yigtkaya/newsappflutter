// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'source_model.dart';

class SourceMapper extends ClassMapperBase<Source> {
  SourceMapper._();

  static SourceMapper? _instance;
  static SourceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SourceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Source';

  static String? _$id(Source v) => v.id;
  static const Field<Source, String> _f$id = Field('id', _$id, opt: true);
  static String? _$name(Source v) => v.name;
  static const Field<Source, String> _f$name = Field('name', _$name, opt: true);

  @override
  final MappableFields<Source> fields = const {
    #id: _f$id,
    #name: _f$name,
  };

  static Source _instantiate(DecodingData data) {
    return Source(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Source fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Source>(map);
  }

  static Source fromJson(String json) {
    return ensureInitialized().decodeJson<Source>(json);
  }
}

mixin SourceMappable {
  String toJson() {
    return SourceMapper.ensureInitialized().encodeJson<Source>(this as Source);
  }

  Map<String, dynamic> toMap() {
    return SourceMapper.ensureInitialized().encodeMap<Source>(this as Source);
  }

  SourceCopyWith<Source, Source, Source> get copyWith => _SourceCopyWithImpl(this as Source, $identity, $identity);
  @override
  String toString() {
    return SourceMapper.ensureInitialized().stringifyValue(this as Source);
  }

  @override
  bool operator ==(Object other) {
    return SourceMapper.ensureInitialized().equalsValue(this as Source, other);
  }

  @override
  int get hashCode {
    return SourceMapper.ensureInitialized().hashValue(this as Source);
  }
}

extension SourceValueCopy<$R, $Out> on ObjectCopyWith<$R, Source, $Out> {
  SourceCopyWith<$R, Source, $Out> get $asSource => $base.as((v, t, t2) => _SourceCopyWithImpl(v, t, t2));
}

abstract class SourceCopyWith<$R, $In extends Source, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name});
  SourceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SourceCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Source, $Out>
    implements SourceCopyWith<$R, Source, $Out> {
  _SourceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Source> $mapper = SourceMapper.ensureInitialized();
  @override
  $R call({Object? id = $none, Object? name = $none}) =>
      $apply(FieldCopyWithData({if (id != $none) #id: id, if (name != $none) #name: name}));
  @override
  Source $make(CopyWithData data) => Source(id: data.get(#id, or: $value.id), name: data.get(#name, or: $value.name));

  @override
  SourceCopyWith<$R2, Source, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _SourceCopyWithImpl($value, $cast, t);
}
