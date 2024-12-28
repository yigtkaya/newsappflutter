// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'everything_news_request.dart';

class EverythingNewsRequestMapper extends ClassMapperBase<EverythingNewsRequest> {
  EverythingNewsRequestMapper._();

  static EverythingNewsRequestMapper? _instance;
  static EverythingNewsRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EverythingNewsRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'EverythingNewsRequest';

  static String? _$q(EverythingNewsRequest v) => v.q;
  static const Field<EverythingNewsRequest, String> _f$q = Field('q', _$q, opt: true);
  static List<String>? _$searchIn(EverythingNewsRequest v) => v.searchIn;
  static const Field<EverythingNewsRequest, List<String>> _f$searchIn = Field('searchIn', _$searchIn, opt: true);
  static List<String>? _$sources(EverythingNewsRequest v) => v.sources;
  static const Field<EverythingNewsRequest, List<String>> _f$sources = Field('sources', _$sources, opt: true);
  static List<String>? _$domains(EverythingNewsRequest v) => v.domains;
  static const Field<EverythingNewsRequest, List<String>> _f$domains = Field('domains', _$domains, opt: true);
  static List<String>? _$excludeDomains(EverythingNewsRequest v) => v.excludeDomains;
  static const Field<EverythingNewsRequest, List<String>> _f$excludeDomains =
      Field('excludeDomains', _$excludeDomains, opt: true);
  static DateTime? _$from(EverythingNewsRequest v) => v.from;
  static const Field<EverythingNewsRequest, DateTime> _f$from = Field('from', _$from, opt: true);
  static DateTime? _$to(EverythingNewsRequest v) => v.to;
  static const Field<EverythingNewsRequest, DateTime> _f$to = Field('to', _$to, opt: true);
  static String? _$language(EverythingNewsRequest v) => v.language;
  static const Field<EverythingNewsRequest, String> _f$language = Field('language', _$language, opt: true);
  static String? _$sortBy(EverythingNewsRequest v) => v.sortBy;
  static const Field<EverythingNewsRequest, String> _f$sortBy = Field('sortBy', _$sortBy, opt: true);
  static int? _$pageSize(EverythingNewsRequest v) => v.pageSize;
  static const Field<EverythingNewsRequest, int> _f$pageSize = Field('pageSize', _$pageSize, opt: true);
  static int? _$page(EverythingNewsRequest v) => v.page;
  static const Field<EverythingNewsRequest, int> _f$page = Field('page', _$page, opt: true);

  @override
  final MappableFields<EverythingNewsRequest> fields = const {
    #q: _f$q,
    #searchIn: _f$searchIn,
    #sources: _f$sources,
    #domains: _f$domains,
    #excludeDomains: _f$excludeDomains,
    #from: _f$from,
    #to: _f$to,
    #language: _f$language,
    #sortBy: _f$sortBy,
    #pageSize: _f$pageSize,
    #page: _f$page,
  };

  static EverythingNewsRequest _instantiate(DecodingData data) {
    return EverythingNewsRequest(
        q: data.dec(_f$q),
        searchIn: data.dec(_f$searchIn),
        sources: data.dec(_f$sources),
        domains: data.dec(_f$domains),
        excludeDomains: data.dec(_f$excludeDomains),
        from: data.dec(_f$from),
        to: data.dec(_f$to),
        language: data.dec(_f$language),
        sortBy: data.dec(_f$sortBy),
        pageSize: data.dec(_f$pageSize),
        page: data.dec(_f$page));
  }

  @override
  final Function instantiate = _instantiate;

  static EverythingNewsRequest fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EverythingNewsRequest>(map);
  }

  static EverythingNewsRequest fromJson(String json) {
    return ensureInitialized().decodeJson<EverythingNewsRequest>(json);
  }
}

mixin EverythingNewsRequestMappable {
  String toJson() {
    return EverythingNewsRequestMapper.ensureInitialized()
        .encodeJson<EverythingNewsRequest>(this as EverythingNewsRequest);
  }

  Map<String, dynamic> toMap() {
    return EverythingNewsRequestMapper.ensureInitialized()
        .encodeMap<EverythingNewsRequest>(this as EverythingNewsRequest);
  }

  EverythingNewsRequestCopyWith<EverythingNewsRequest, EverythingNewsRequest, EverythingNewsRequest> get copyWith =>
      _EverythingNewsRequestCopyWithImpl(this as EverythingNewsRequest, $identity, $identity);
  @override
  String toString() {
    return EverythingNewsRequestMapper.ensureInitialized().stringifyValue(this as EverythingNewsRequest);
  }

  @override
  bool operator ==(Object other) {
    return EverythingNewsRequestMapper.ensureInitialized().equalsValue(this as EverythingNewsRequest, other);
  }

  @override
  int get hashCode {
    return EverythingNewsRequestMapper.ensureInitialized().hashValue(this as EverythingNewsRequest);
  }
}

extension EverythingNewsRequestValueCopy<$R, $Out> on ObjectCopyWith<$R, EverythingNewsRequest, $Out> {
  EverythingNewsRequestCopyWith<$R, EverythingNewsRequest, $Out> get $asEverythingNewsRequest =>
      $base.as((v, t, t2) => _EverythingNewsRequestCopyWithImpl(v, t, t2));
}

abstract class EverythingNewsRequestCopyWith<$R, $In extends EverythingNewsRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get searchIn;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get sources;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get domains;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get excludeDomains;
  $R call(
      {String? q,
      List<String>? searchIn,
      List<String>? sources,
      List<String>? domains,
      List<String>? excludeDomains,
      DateTime? from,
      DateTime? to,
      String? language,
      String? sortBy,
      int? pageSize,
      int? page});
  EverythingNewsRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EverythingNewsRequestCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, EverythingNewsRequest, $Out>
    implements EverythingNewsRequestCopyWith<$R, EverythingNewsRequest, $Out> {
  _EverythingNewsRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EverythingNewsRequest> $mapper = EverythingNewsRequestMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get searchIn => $value.searchIn != null
      ? ListCopyWith($value.searchIn!, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(searchIn: v))
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get sources => $value.sources != null
      ? ListCopyWith($value.sources!, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(sources: v))
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get domains => $value.domains != null
      ? ListCopyWith($value.domains!, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(domains: v))
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get excludeDomains => $value.excludeDomains != null
      ? ListCopyWith($value.excludeDomains!, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(excludeDomains: v))
      : null;
  @override
  $R call(
          {Object? q = $none,
          Object? searchIn = $none,
          Object? sources = $none,
          Object? domains = $none,
          Object? excludeDomains = $none,
          Object? from = $none,
          Object? to = $none,
          Object? language = $none,
          Object? sortBy = $none,
          Object? pageSize = $none,
          Object? page = $none}) =>
      $apply(FieldCopyWithData({
        if (q != $none) #q: q,
        if (searchIn != $none) #searchIn: searchIn,
        if (sources != $none) #sources: sources,
        if (domains != $none) #domains: domains,
        if (excludeDomains != $none) #excludeDomains: excludeDomains,
        if (from != $none) #from: from,
        if (to != $none) #to: to,
        if (language != $none) #language: language,
        if (sortBy != $none) #sortBy: sortBy,
        if (pageSize != $none) #pageSize: pageSize,
        if (page != $none) #page: page
      }));
  @override
  EverythingNewsRequest $make(CopyWithData data) => EverythingNewsRequest(
      q: data.get(#q, or: $value.q),
      searchIn: data.get(#searchIn, or: $value.searchIn),
      sources: data.get(#sources, or: $value.sources),
      domains: data.get(#domains, or: $value.domains),
      excludeDomains: data.get(#excludeDomains, or: $value.excludeDomains),
      from: data.get(#from, or: $value.from),
      to: data.get(#to, or: $value.to),
      language: data.get(#language, or: $value.language),
      sortBy: data.get(#sortBy, or: $value.sortBy),
      pageSize: data.get(#pageSize, or: $value.pageSize),
      page: data.get(#page, or: $value.page));

  @override
  EverythingNewsRequestCopyWith<$R2, EverythingNewsRequest, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _EverythingNewsRequestCopyWithImpl($value, $cast, t);
}
