import 'package:newsappflutter/core/cache/core/cache_model.dart';
import 'package:newsappflutter/features/home/data/models/response/article_model.dart';

final class BookmarkedNewsEntity with CacheModel {
  BookmarkedNewsEntity({
    required this.articles,
  });

  BookmarkedNewsEntity.empty() : articles = [];

  final List<Article> articles;

  @override
  Map<String, dynamic> toJson() {
    return {
      'articles': articles.map((e) => e.toMap()).toList(),
    };
  }

  @override
  CacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>;

    if (jsonMap.isEmpty) {
      return this;
    }

    final articlesList = (jsonMap['articles'] as List)
        .map(
          (e) => ArticleMapper.fromMap(e as Map<String, dynamic>),
        )
        .toList();

    return copyWith(articles: articlesList);
  }

  BookmarkedNewsEntity copyWith({
    List<Article>? articles,
    String? id,
  }) {
    return BookmarkedNewsEntity(
      articles: articles ?? this.articles,
    );
  }

  @override
  String get id => 'bookmarked_news_cache_key';
}
