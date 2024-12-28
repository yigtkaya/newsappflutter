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
      ArticleMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NewsResponse';

  static String? _$status(NewsResponse v) => v.status;
  static const Field<NewsResponse, String> _f$status = Field('status', _$status, opt: true);
  static int? _$totalResults(NewsResponse v) => v.totalResults;
  static const Field<NewsResponse, int> _f$totalResults = Field('totalResults', _$totalResults, opt: true);
  static List<Article>? _$articles(NewsResponse v) => v.articles;
  static const Field<NewsResponse, List<Article>> _f$articles = Field('articles', _$articles, opt: true);

  @override
  final MappableFields<NewsResponse> fields = const {
    #status: _f$status,
    #totalResults: _f$totalResults,
    #articles: _f$articles,
  };

  static NewsResponse _instantiate(DecodingData data) {
    return NewsResponse(
        status: data.dec(_f$status), totalResults: data.dec(_f$totalResults), articles: data.dec(_f$articles));
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
  ListCopyWith<$R, Article, ArticleCopyWith<$R, Article, Article>>? get articles;
  $R call({String? status, int? totalResults, List<Article>? articles});
  NewsResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NewsResponseCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, NewsResponse, $Out>
    implements NewsResponseCopyWith<$R, NewsResponse, $Out> {
  _NewsResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NewsResponse> $mapper = NewsResponseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Article, ArticleCopyWith<$R, Article, Article>>? get articles => $value.articles != null
      ? ListCopyWith($value.articles!, (v, t) => v.copyWith.$chain(t), (v) => call(articles: v))
      : null;
  @override
  $R call({Object? status = $none, Object? totalResults = $none, Object? articles = $none}) =>
      $apply(FieldCopyWithData({
        if (status != $none) #status: status,
        if (totalResults != $none) #totalResults: totalResults,
        if (articles != $none) #articles: articles
      }));
  @override
  NewsResponse $make(CopyWithData data) => NewsResponse(
      status: data.get(#status, or: $value.status),
      totalResults: data.get(#totalResults, or: $value.totalResults),
      articles: data.get(#articles, or: $value.articles));

  @override
  NewsResponseCopyWith<$R2, NewsResponse, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NewsResponseCopyWithImpl($value, $cast, t);
}
