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
    }
    return _instance!;
  }

  @override
  final String id = 'Article';

  static String _$uuid(Article v) => v.uuid;
  static const Field<Article, String> _f$uuid = Field('uuid', _$uuid);
  static String _$title(Article v) => v.title;
  static const Field<Article, String> _f$title = Field('title', _$title);
  static String _$description(Article v) => v.description;
  static const Field<Article, String> _f$description = Field('description', _$description);
  static String? _$keywords(Article v) => v.keywords;
  static const Field<Article, String> _f$keywords = Field('keywords', _$keywords);
  static String _$snippet(Article v) => v.snippet;
  static const Field<Article, String> _f$snippet = Field('snippet', _$snippet);
  static String _$url(Article v) => v.url;
  static const Field<Article, String> _f$url = Field('url', _$url);
  static String? _$imageUrl(Article v) => v.imageUrl;
  static const Field<Article, String> _f$imageUrl = Field('imageUrl', _$imageUrl);
  static String _$language(Article v) => v.language;
  static const Field<Article, String> _f$language = Field('language', _$language);
  static DateTime _$publishedAt(Article v) => v.publishedAt;
  static const Field<Article, DateTime> _f$publishedAt = Field('publishedAt', _$publishedAt);
  static String _$source(Article v) => v.source;
  static const Field<Article, String> _f$source = Field('source', _$source);
  static List<String> _$categories(Article v) => v.categories;
  static const Field<Article, List<String>> _f$categories = Field('categories', _$categories);
  static double? _$relevanceScore(Article v) => v.relevanceScore;
  static const Field<Article, double> _f$relevanceScore = Field('relevanceScore', _$relevanceScore, opt: true);

  @override
  final MappableFields<Article> fields = const {
    #uuid: _f$uuid,
    #title: _f$title,
    #description: _f$description,
    #keywords: _f$keywords,
    #snippet: _f$snippet,
    #url: _f$url,
    #imageUrl: _f$imageUrl,
    #language: _f$language,
    #publishedAt: _f$publishedAt,
    #source: _f$source,
    #categories: _f$categories,
    #relevanceScore: _f$relevanceScore,
  };

  static Article _instantiate(DecodingData data) {
    return Article(
        uuid: data.dec(_f$uuid),
        title: data.dec(_f$title),
        description: data.dec(_f$description),
        keywords: data.dec(_f$keywords),
        snippet: data.dec(_f$snippet),
        url: data.dec(_f$url),
        imageUrl: data.dec(_f$imageUrl),
        language: data.dec(_f$language),
        publishedAt: data.dec(_f$publishedAt),
        source: data.dec(_f$source),
        categories: data.dec(_f$categories),
        relevanceScore: data.dec(_f$relevanceScore));
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get categories;
  $R call(
      {String? uuid,
      String? title,
      String? description,
      String? keywords,
      String? snippet,
      String? url,
      String? imageUrl,
      String? language,
      DateTime? publishedAt,
      String? source,
      List<String>? categories,
      double? relevanceScore});
  ArticleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ArticleCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Article, $Out>
    implements ArticleCopyWith<$R, Article, $Out> {
  _ArticleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Article> $mapper = ArticleMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get categories =>
      ListCopyWith($value.categories, (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(categories: v));
  @override
  $R call(
          {String? uuid,
          String? title,
          String? description,
          Object? keywords = $none,
          String? snippet,
          String? url,
          Object? imageUrl = $none,
          String? language,
          DateTime? publishedAt,
          String? source,
          List<String>? categories,
          Object? relevanceScore = $none}) =>
      $apply(FieldCopyWithData({
        if (uuid != null) #uuid: uuid,
        if (title != null) #title: title,
        if (description != null) #description: description,
        if (keywords != $none) #keywords: keywords,
        if (snippet != null) #snippet: snippet,
        if (url != null) #url: url,
        if (imageUrl != $none) #imageUrl: imageUrl,
        if (language != null) #language: language,
        if (publishedAt != null) #publishedAt: publishedAt,
        if (source != null) #source: source,
        if (categories != null) #categories: categories,
        if (relevanceScore != $none) #relevanceScore: relevanceScore
      }));
  @override
  Article $make(CopyWithData data) => Article(
      uuid: data.get(#uuid, or: $value.uuid),
      title: data.get(#title, or: $value.title),
      description: data.get(#description, or: $value.description),
      keywords: data.get(#keywords, or: $value.keywords),
      snippet: data.get(#snippet, or: $value.snippet),
      url: data.get(#url, or: $value.url),
      imageUrl: data.get(#imageUrl, or: $value.imageUrl),
      language: data.get(#language, or: $value.language),
      publishedAt: data.get(#publishedAt, or: $value.publishedAt),
      source: data.get(#source, or: $value.source),
      categories: data.get(#categories, or: $value.categories),
      relevanceScore: data.get(#relevanceScore, or: $value.relevanceScore));

  @override
  ArticleCopyWith<$R2, Article, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) => _ArticleCopyWithImpl($value, $cast, t);
}
