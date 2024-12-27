import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/home/data/models/response/article_model.dart';

abstract interface class BookmarksRepository {
  Future<Either<Failure, List<Article>>> getBookmarkedNews();
  Future<Either<Failure, void>> bookmarkNews(Article article);
  Future<Either<Failure, void>> removeFromBookmarks(String articleId);
  Future<Either<Failure, void>> clearBookmarks();
}
