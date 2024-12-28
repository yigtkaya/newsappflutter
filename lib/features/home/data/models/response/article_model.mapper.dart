// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'article_model.dart';

class ArticleMapper extends ClassMapperBase<Article> {
  ArticleMapper._();

  static ArticleMapper? _instance;
  static ArticleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArticleMapper._());
      SourceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Article';

  static Source? _$source(Article v) => v.source;
  static const Field<Article, Source> _f$source = Field('source', _$source, opt: true);
  static String? _$author(Article v) => v.author;
  static const Field<Article, String> _f$author = Field('author', _$author, opt: true);
  static String? _$title(Article v) => v.title;
  static const Field<Article, String> _f$title = Field('title', _$title, opt: true);
  static String? _$description(Article v) => v.description;
  static const Field<Article, String> _f$description = Field('description', _$description, opt: true);
  static String? _$url(Article v) => v.url;
  static const Field<Article, String> _f$url = Field('url', _$url, opt: true);
  static String? _$urlToImage(Article v) => v.urlToImage;
  static const Field<Article, String> _f$urlToImage = Field('urlToImage', _$urlToImage, opt: true);
  static DateTime? _$publishedAt(Article v) => v.publishedAt;
  static const Field<Article, DateTime> _f$publishedAt = Field('publishedAt', _$publishedAt, opt: true);
  static String? _$content(Article v) => v.content;
  static const Field<Article, String> _f$content = Field('content', _$content, opt: true);

  @override
  final MappableFields<Article> fields = const {
    #source: _f$source,
    #author: _f$author,
    #title: _f$title,
    #description: _f$description,
    #url: _f$url,
    #urlToImage: _f$urlToImage,
    #publishedAt: _f$publishedAt,
    #content: _f$content,
  };

  static Article _instantiate(DecodingData data) {
    return Article(
        source: data.dec(_f$source),
        author: data.dec(_f$author),
        title: data.dec(_f$title),
        description: data.dec(_f$description),
        url: data.dec(_f$url),
        urlToImage: data.dec(_f$urlToImage),
        publishedAt: data.dec(_f$publishedAt),
        content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static Article fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Article>(map);
  }

  static Article fromJson(String json) {
    return ensureInitialized().decodeJson<Article>(json);
  }
}

mixin ArticleMappable {
  String toJson() {
    return ArticleMapper.ensureInitialized().encodeJson<Article>(this as Article);
  }

  Map<String, dynamic> toMap() {
    return ArticleMapper.ensureInitialized().encodeMap<Article>(this as Article);
  }

  ArticleCopyWith<Article, Article, Article> get copyWith =>
      _ArticleCopyWithImpl(this as Article, $identity, $identity);
  @override
  String toString() {
    return ArticleMapper.ensureInitialized().stringifyValue(this as Article);
  }

  @override
  bool operator ==(Object other) {
    return ArticleMapper.ensureInitialized().equalsValue(this as Article, other);
  }

  @override
  int get hashCode {
    return ArticleMapper.ensureInitialized().hashValue(this as Article);
  }
}

extension ArticleValueCopy<$R, $Out> on ObjectCopyWith<$R, Article, $Out> {
  ArticleCopyWith<$R, Article, $Out> get $asArticle => $base.as((v, t, t2) => _ArticleCopyWithImpl(v, t, t2));
}

abstract class ArticleCopyWith<$R, $In extends Article, $Out> implements ClassCopyWith<$R, $In, $Out> {
  SourceCopyWith<$R, Source, Source>? get source;
  $R call(
      {Source? source,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      DateTime? publishedAt,
      String? content});
  ArticleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ArticleCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Article, $Out>
    implements ArticleCopyWith<$R, Article, $Out> {
  _ArticleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Article> $mapper = ArticleMapper.ensureInitialized();
  @override
  SourceCopyWith<$R, Source, Source>? get source => $value.source?.copyWith.$chain((v) => call(source: v));
  @override
  $R call(
          {Object? source = $none,
          Object? author = $none,
          Object? title = $none,
          Object? description = $none,
          Object? url = $none,
          Object? urlToImage = $none,
          Object? publishedAt = $none,
          Object? content = $none}) =>
      $apply(FieldCopyWithData({
        if (source != $none) #source: source,
        if (author != $none) #author: author,
        if (title != $none) #title: title,
        if (description != $none) #description: description,
        if (url != $none) #url: url,
        if (urlToImage != $none) #urlToImage: urlToImage,
        if (publishedAt != $none) #publishedAt: publishedAt,
        if (content != $none) #content: content
      }));
  @override
  Article $make(CopyWithData data) => Article(
      source: data.get(#source, or: $value.source),
      author: data.get(#author, or: $value.author),
      title: data.get(#title, or: $value.title),
      description: data.get(#description, or: $value.description),
      url: data.get(#url, or: $value.url),
      urlToImage: data.get(#urlToImage, or: $value.urlToImage),
      publishedAt: data.get(#publishedAt, or: $value.publishedAt),
      content: data.get(#content, or: $value.content));

  @override
  ArticleCopyWith<$R2, Article, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _ArticleCopyWithImpl($value, $cast, t);
}
