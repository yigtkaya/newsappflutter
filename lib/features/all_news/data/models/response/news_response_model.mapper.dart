// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'news_response_model.dart';

class NewsResponseMapper extends ClassMapperBase<NewsResponse> {
  NewsResponseMapper._();

  static NewsResponseMapper? _instance;
  static NewsResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NewsResponseMapper._());
      MetaMapper.ensureInitialized();
      ArticleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NewsResponse';

  static Meta _$meta(NewsResponse v) => v.meta;
  static const Field<NewsResponse, Meta> _f$meta = Field('meta', _$meta);
  static List<Article> _$data(NewsResponse v) => v.data;
  static const Field<NewsResponse, List<Article>> _f$data = Field('data', _$data);

  @override
  final MappableFields<NewsResponse> fields = const {
    #meta: _f$meta,
    #data: _f$data,
  };

  static NewsResponse _instantiate(DecodingData data) {
    return NewsResponse(meta: data.dec(_f$meta), data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static NewsResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NewsResponse>(map);
  }

  static NewsResponse fromJson(String json) {
    return ensureInitialized().decodeJson<NewsResponse>(json);
  }
}

mixin NewsResponseMappable {
  String toJson() {
    return NewsResponseMapper.ensureInitialized().encodeJson<NewsResponse>(this as NewsResponse);
  }

  Map<String, dynamic> toMap() {
    return NewsResponseMapper.ensureInitialized().encodeMap<NewsResponse>(this as NewsResponse);
  }

  NewsResponseCopyWith<NewsResponse, NewsResponse, NewsResponse> get copyWith =>
      _NewsResponseCopyWithImpl(this as NewsResponse, $identity, $identity);
  @override
  String toString() {
    return NewsResponseMapper.ensureInitialized().stringifyValue(this as NewsResponse);
  }

  @override
  bool operator ==(Object other) {
    return NewsResponseMapper.ensureInitialized().equalsValue(this as NewsResponse, other);
  }

  @override
  int get hashCode {
    return NewsResponseMapper.ensureInitialized().hashValue(this as NewsResponse);
  }
}

extension NewsResponseValueCopy<$R, $Out> on ObjectCopyWith<$R, NewsResponse, $Out> {
  NewsResponseCopyWith<$R, NewsResponse, $Out> get $asNewsResponse =>
      $base.as((v, t, t2) => _NewsResponseCopyWithImpl(v, t, t2));
}

abstract class NewsResponseCopyWith<$R, $In extends NewsResponse, $Out> implements ClassCopyWith<$R, $In, $Out> {
  MetaCopyWith<$R, Meta, Meta> get meta;
  ListCopyWith<$R, Article, ArticleCopyWith<$R, Article, Article>> get data;
  $R call({Meta? meta, List<Article>? data});
  NewsResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NewsResponseCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, NewsResponse, $Out>
    implements NewsResponseCopyWith<$R, NewsResponse, $Out> {
  _NewsResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NewsResponse> $mapper = NewsResponseMapper.ensureInitialized();
  @override
  MetaCopyWith<$R, Meta, Meta> get meta => $value.meta.copyWith.$chain((v) => call(meta: v));
  @override
  ListCopyWith<$R, Article, ArticleCopyWith<$R, Article, Article>> get data =>
      ListCopyWith($value.data, (v, t) => v.copyWith.$chain(t), (v) => call(data: v));
  @override
  $R call({Meta? meta, List<Article>? data}) =>
      $apply(FieldCopyWithData({if (meta != null) #meta: meta, if (data != null) #data: data}));
  @override
  NewsResponse $make(CopyWithData data) =>
      NewsResponse(meta: data.get(#meta, or: $value.meta), data: data.get(#data, or: $value.data));

  @override
  NewsResponseCopyWith<$R2, NewsResponse, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NewsResponseCopyWithImpl($value, $cast, t);
}
