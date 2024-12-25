import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/base_repository.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/home/data/datasources/news_api_client.dart';
import 'package:newsappflutter/features/home/data/models/requests/news_request.dart';
import 'package:newsappflutter/features/home/data/models/response/news_response_model.dart';
import 'package:newsappflutter/features/home/domain/repository/news_repository.dart';

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
    final request = NewsRequest(
      locale: locale,
      limit: limit,
      categories: categories,
    );

    return handleNetworkCall(
      call: () => _apiClient.getTopStories(
        request.toQueryParameters(),
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
    final request = NewsRequest(
      locale: locale,
      limit: limit,
      categories: categories,
      search: search,
      page: page,
    );

    return handleNetworkCall(
      call: () => _apiClient.getAllNews(request.toQueryParameters()),
    );
  }

  @override
  Future<Either<Failure, NewsResponse>> getSimilarNews({
    required String uuid,
    int? limit,
  }) {
    final request = NewsRequest(limit: limit);
    return handleNetworkCall(
      call: () => _apiClient.getSimilarNews(
        uuid: uuid,
        queries: request.toQueryParameters(),
      ),
    );
  }
}
