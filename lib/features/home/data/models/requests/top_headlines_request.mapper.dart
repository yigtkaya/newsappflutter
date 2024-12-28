// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'top_headlines_request.dart';

class TopHeadlinesRequestMapper extends ClassMapperBase<TopHeadlinesRequest> {
  TopHeadlinesRequestMapper._();

  static TopHeadlinesRequestMapper? _instance;
  static TopHeadlinesRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TopHeadlinesRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TopHeadlinesRequest';

  static String? _$country(TopHeadlinesRequest v) => v.country;
  static const Field<TopHeadlinesRequest, String> _f$country = Field('country', _$country, opt: true);
  static String? _$category(TopHeadlinesRequest v) => v.category;
  static const Field<TopHeadlinesRequest, String> _f$category = Field('category', _$category, opt: true);
  static List<String>? _$sources(TopHeadlinesRequest v) => v.sources;
  static const Field<TopHeadlinesRequest, List<String>> _f$sources = Field('sources', _$sources, opt: true);
  static String? _$q(TopHeadlinesRequest v) => v.q;
  static const Field<TopHeadlinesRequest, String> _f$q = Field('q', _$q, opt: true);
  static int? _$pageSize(TopHeadlinesRequest v) => v.pageSize;
  static const Field<TopHeadlinesRequest, int> _f$pageSize = Field('pageSize', _$pageSize, opt: true);
  static int? _$page(TopHeadlinesRequest v) => v.page;
  static const Field<TopHeadlinesRequest, int> _f$page = Field('page', _$page, opt: true);
  static String? _$language(TopHeadlinesRequest v) => v.language;
  static const Field<TopHeadlinesRequest, String> _f$language = Field('language', _$language, opt: true);

  @override
  final MappableFields<TopHeadlinesRequest> fields = const {
    #country: _f$country,
    #category: _f$category,
    #sources: _f$sources,
    #q: _f$q,
    #pageSize: _f$pageSize,
    #page: _f$page,
    #language: _f$language,
  };

  static TopHeadlinesRequest _instantiate(DecodingData data) {
    return TopHeadlinesRequest(
        country: data.dec(_f$country),
        category: data.dec(_f$category),
        sources: data.dec(_f$sources),
        q: data.dec(_f$q),
        pageSize: data.dec(_f$pageSize),
        page: data.dec(_f$page),
        language: data.dec(_f$language));
  }

  @override
  final Function instantiate = _instantiate;

  static TopHeadlinesRequest fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TopHeadlinesRequest>(map);
  }

  static TopHeadlinesRequest fromJson(String json) {
    return ensureInitialized().decodeJson<TopHeadlinesRequest>(json);
  }
}

mixin TopHeadlinesRequestMappable {
  String toJson() {
    return TopHeadlinesRequestMapper.ensureInitialized().encodeJson<TopHeadlinesRequest>(this as TopHeadlinesRequest);
  }

  Map<String, dynamic> toMap() {
    return TopHeadlinesRequestMapper.ensureInitialized().encodeMap<TopHeadlinesRequest>(this as TopHeadlinesRequest);
  }

  TopHeadlinesRequestCopyWith<TopHeadlinesRequest, TopHeadlinesRequest, TopHeadlinesRequest> get copyWith =>
      _TopHeadlinesRequestCopyWithImpl(this as TopHeadlinesRequest, $identity, $identity);
  @override
  String toString() {
    return TopHeadlinesRequestMapper.ensureInitialized().stringifyValue(this as TopHeadlinesRequest);
  }

  @override
  bool operator ==(Object other) {
    return TopHeadlinesRequestMapper.ensureInitialized().equalsValue(this as TopHeadlinesRequest, other);
  }

  @override
  int get hashCode {
    return TopHeadlinesRequestMapper.ensureInitialized().hashValue(this as TopHeadlinesRequest);
  }
}

extension TopHeadlinesRequestValueCopy<$R, $Out> on ObjectCopyWith<$R, TopHeadlinesRequest, $Out> {
  TopHeadlinesRequestCopyWith<$R, TopHeadlinesRequest, $Out> get $asTopHeadlinesRequest =>
      $base.as((v, t, t2) => _TopHeadlinesRequestCopyWithImpl(v, t, t2));
}

abstract class TopHeadlinesRequestCopyWith<$R, $In extends TopHeadlinesRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get sources;
  $R call(
      {String? country,
      String? category,
      List<String>? sources,
      String? q,
      int? pageSize,
      int? page,
      String? language});
  TopHeadlinesRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TopHeadlinesRequestCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, TopHeadlinesRequest, $Out>
    implements TopHeadlinesRequestCopyWith<$R, TopHeadlinesRequest, $Out> {
  _TopHeadlinesRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TopHeadlinesRequest> $mapper = TopHeadlinesRequestMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get sources => $value.sources != null
      ? ListCopyWith($value.sources!, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(sources: v))
      : null;
  @override
  $R call(
          {Object? country = $none,
          Object? category = $none,
          Object? sources = $none,
          Object? q = $none,
          Object? pageSize = $none,
          Object? page = $none,
          Object? language = $none}) =>
      $apply(FieldCopyWithData({
        if (country != $none) #country: country,
        if (category != $none) #category: category,
        if (sources != $none) #sources: sources,
        if (q != $none) #q: q,
        if (pageSize != $none) #pageSize: pageSize,
        if (page != $none) #page: page,
        if (language != $none) #language: language
      }));
  @override
  TopHeadlinesRequest $make(CopyWithData data) => TopHeadlinesRequest(
      country: data.get(#country, or: $value.country),
      category: data.get(#category, or: $value.category),
      sources: data.get(#sources, or: $value.sources),
      q: data.get(#q, or: $value.q),
      pageSize: data.get(#pageSize, or: $value.pageSize),
      page: data.get(#page, or: $value.page),
      language: data.get(#language, or: $value.language));

  @override
  TopHeadlinesRequestCopyWith<$R2, TopHeadlinesRequest, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TopHeadlinesRequestCopyWithImpl($value, $cast, t);
}
