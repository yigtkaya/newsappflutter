import 'package:dart_mappable/dart_mappable.dart';

part 'article_model.mapper.dart';

@MappableClass()
class Article with ArticleMappable {
  const Article({
    required this.uuid,
    required this.title,
    required this.description,
    required this.keywords,
    required this.snippet,
    required this.url,
    required this.imageUrl,
    required this.language,
    required this.publishedAt,
    required this.source,
    required this.categories,
    this.relevanceScore,
  });

  final String uuid;
  final String title;
  final String description;
  final String? keywords;
  final String snippet;
  final String url;
  @MappableField(key: 'image_url')
  final String? imageUrl;
  final String language;
  @MappableField(key: 'published_at')
  final DateTime publishedAt;
  final String source;
  final List<String> categories;
  @MappableField(key: 'relevance_score')
  final double? relevanceScore;
}
