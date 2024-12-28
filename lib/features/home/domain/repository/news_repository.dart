import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/home/data/models/response/news_response_model.dart';

/// News Repository
abstract interface class NewsRepository {
  /// Get top headlines news
  Future<Either<Failure, NewsResponse>> getTopHeadlines({
    String? country,
    String? category,
    List<String>? sources,
    String? q,
    int? pageSize,
    int? page,
    String? language,
  });

  /// Get everything news
  Future<Either<Failure, NewsResponse>> getEverything({
    String? q,
    List<String>? searchIn,
    List<String>? sources,
    List<String>? domains,
    List<String>? excludeDomains,
    DateTime? from,
    DateTime? to,
    String? language,
    String? sortBy,
    int? pageSize,
    int? page,
  });
}
