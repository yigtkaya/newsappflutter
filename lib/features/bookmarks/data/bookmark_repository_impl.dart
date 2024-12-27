import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/di/dependecy_injection_items.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/bookmarks/domain/entities/bookmarked_news_entity.dart';
import 'package:newsappflutter/features/bookmarks/domain/repositories/bookmarks_repository.dart';
import 'package:newsappflutter/features/home/data/models/response/article_model.dart';

class BookmarksRepositoryImpl implements BookmarksRepository {
  @override
  Future<Either<Failure, List<Article>>> getBookmarkedNews() async {
    try {
      final cachedNews = DepInItems.productCache.bookmarkedNewsCacheOperation.get(
        'bookmarked_news_cache_key',
      );
      return Right(
        cachedNews?.articles ?? [],
      );
    } catch (e) {
      return Left(
        Failure(
          message: 'Failed to get bookmarked news',
          code: '500',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> bookmarkNews(Article article) async {
    try {
      final cachedNews = DepInItems.productCache.bookmarkedNewsCacheOperation.get(
            'bookmarked_news_cache_key',
          ) ??
          BookmarkedNewsEntity.empty();

      final updatedArticles = [...cachedNews.articles, article];

      DepInItems.productCache.bookmarkedNewsCacheOperation.add(
        BookmarkedNewsEntity(
          articles: updatedArticles,
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(
        Failure(
          message: 'Failed to bookmark news',
          code: '500',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeFromBookmarks(String articleId) async {
    try {
      final cachedNews = DepInItems.productCache.bookmarkedNewsCacheOperation.get(
        'bookmarked_news_cache_key',
      );

      if (cachedNews == null) return const Right(null);

      final updatedArticles = cachedNews.articles
          .where(
            (article) => article.uuid != articleId,
          )
          .toList();

      DepInItems.productCache.bookmarkedNewsCacheOperation.add(
        BookmarkedNewsEntity(
          articles: updatedArticles,
        ),
      );
      return const Right(null);
    } catch (e) {
      return Left(
        Failure(
          message: 'Failed to remove from bookmarks',
          code: '500',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> clearBookmarks() async {
    try {
      DepInItems.productCache.bookmarkedNewsCacheOperation.clear();
      return const Right(null);
    } catch (e) {
      return Left(
        Failure(
          message: 'Failed to clear bookmarks',
          code: '500',
        ),
      );
    }
  }
}
