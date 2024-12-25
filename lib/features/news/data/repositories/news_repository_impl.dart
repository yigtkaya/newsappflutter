import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/base_repository.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/all_news/data/models/response/news_response_model.dart';
import 'package:newsappflutter/features/news/data/datasources/news_api_client.dart';
import 'package:newsappflutter/features/news/data/models/requests/news_request.dart';
import 'package:newsappflutter/features/news/domain/repositories/news_repository.dart';

/// News Repository Implementation
class NewsRepositoryImpl extends BaseRepository implements NewsRepository {
  /// News Repository Implementation
  NewsRepositoryImpl({
    required NewsApiClient apiClient,
  }) : _apiClient = apiClient;

  final NewsApiClient _apiClient;

  @override
  Future<Either<Failure, NewsResponse>> getTopStories({
    String? locale,
    int? limit,
    String? categories,
  }) {
    return handleNetworkCall(
      call: () => _apiClient.getTopStories(
        NewsRequest(
          locale: locale,
          limit: limit,
          categories: categories,
        ),
      ),
    );
  }

  @override
  Future<Either<Failure, NewsResponse>> getAllNews({
    String? locale,
    int? limit,
    String? categories,
    String? search,
    int? page,
  }) {
    return handleNetworkCall(
      call: () => _apiClient.getAllNews(
        NewsRequest(
          locale: locale,
          limit: limit,
          categories: categories,
          search: search,
          page: page,
        ),
      ),
    );
  }

  @override
  Future<Either<Failure, NewsResponse>> getSimilarNews({
    required String uuid,
    int? limit,
  }) {
    return handleNetworkCall(
      call: () => _apiClient.getSimilarNews(
        uuid: uuid,
        request: NewsRequest(limit: limit),
      ),
    );
  }
}
