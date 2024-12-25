// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'news_request.dart';

class NewsRequestMapper extends ClassMapperBase<NewsRequest> {
  NewsRequestMapper._();

  static NewsRequestMapper? _instance;
  static NewsRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NewsRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NewsRequest';

  static String? _$locale(NewsRequest v) => v.locale;
  static const Field<NewsRequest, String> _f$locale = Field('locale', _$locale, opt: true);
  static int? _$limit(NewsRequest v) => v.limit;
  static const Field<NewsRequest, int> _f$limit = Field('limit', _$limit, opt: true);
  static String? _$categories(NewsRequest v) => v.categories;
  static const Field<NewsRequest, String> _f$categories = Field('categories', _$categories, opt: true);
  static String? _$search(NewsRequest v) => v.search;
  static const Field<NewsRequest, String> _f$search = Field('search', _$search, opt: true);
  static int? _$page(NewsRequest v) => v.page;
  static const Field<NewsRequest, int> _f$page = Field('page', _$page, opt: true);

  @override
  final MappableFields<NewsRequest> fields = const {
    #locale: _f$locale,
    #limit: _f$limit,
    #categories: _f$categories,
    #search: _f$search,
    #page: _f$page,
  };

  static NewsRequest _instantiate(DecodingData data) {
    return NewsRequest(
        locale: data.dec(_f$locale),
        limit: data.dec(_f$limit),
        categories: data.dec(_f$categories),
        search: data.dec(_f$search),
        page: data.dec(_f$page));
  }

  @override
  final Function instantiate = _instantiate;

  static NewsRequest fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NewsRequest>(map);
  }

  static NewsRequest fromJson(String json) {
    return ensureInitialized().decodeJson<NewsRequest>(json);
  }
}

mixin NewsRequestMappable {
  String toJson() {
    return NewsRequestMapper.ensureInitialized().encodeJson<NewsRequest>(this as NewsRequest);
  }

  Map<String, dynamic> toMap() {
    return NewsRequestMapper.ensureInitialized().encodeMap<NewsRequest>(this as NewsRequest);
  }

  NewsRequestCopyWith<NewsRequest, NewsRequest, NewsRequest> get copyWith =>
      _NewsRequestCopyWithImpl(this as NewsRequest, $identity, $identity);
  @override
  String toString() {
    return NewsRequestMapper.ensureInitialized().stringifyValue(this as NewsRequest);
  }

  @override
  bool operator ==(Object other) {
    return NewsRequestMapper.ensureInitialized().equalsValue(this as NewsRequest, other);
  }

  @override
  int get hashCode {
    return NewsRequestMapper.ensureInitialized().hashValue(this as NewsRequest);
  }
}

extension NewsRequestValueCopy<$R, $Out> on ObjectCopyWith<$R, NewsRequest, $Out> {
  NewsRequestCopyWith<$R, NewsRequest, $Out> get $asNewsRequest =>
      $base.as((v, t, t2) => _NewsRequestCopyWithImpl(v, t, t2));
}

abstract class NewsRequestCopyWith<$R, $In extends NewsRequest, $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? locale, int? limit, String? categories, String? search, int? page});
  NewsRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NewsRequestCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, NewsRequest, $Out>
    implements NewsRequestCopyWith<$R, NewsRequest, $Out> {
  _NewsRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NewsRequest> $mapper = NewsRequestMapper.ensureInitialized();
  @override
  $R call(
          {Object? locale = $none,
          Object? limit = $none,
          Object? categories = $none,
          Object? search = $none,
          Object? page = $none}) =>
      $apply(FieldCopyWithData({
        if (locale != $none) #locale: locale,
        if (limit != $none) #limit: limit,
        if (categories != $none) #categories: categories,
        if (search != $none) #search: search,
        if (page != $none) #page: page
      }));
  @override
  NewsRequest $make(CopyWithData data) => NewsRequest(
      locale: data.get(#locale, or: $value.locale),
      limit: data.get(#limit, or: $value.limit),
      categories: data.get(#categories, or: $value.categories),
      search: data.get(#search, or: $value.search),
      page: data.get(#page, or: $value.page));

  @override
  NewsRequestCopyWith<$R2, NewsRequest, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NewsRequestCopyWithImpl($value, $cast, t);
}
