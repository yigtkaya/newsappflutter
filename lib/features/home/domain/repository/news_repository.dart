import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/home/data/models/response/news_response_model.dart';

/// News Repository
abstract interface class NewsRepository {
  /// Get top stories
  Future<Either<Failure, NewsResponse>> getTopStories({
    String? locale,
    int? limit,
    String? categories,
  });

  /// Get all news
  Future<Either<Failure, NewsResponse>> getAllNews({
    String? locale,
    int? limit,
    String? categories,
    String? search,
    int? page,
  });

  /// Get similar news
  Future<Either<Failure, NewsResponse>> getSimilarNews({
    required String uuid,
    int? limit,
  });
}
