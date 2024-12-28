import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/base_repository.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/home/data/datasources/news_api_client.dart';
import 'package:newsappflutter/features/home/data/models/requests/everything_news_request.dart';
import 'package:newsappflutter/features/home/data/models/requests/top_headlines_request.dart';
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
  Future<Either<Failure, NewsResponse>> getTopHeadlines({
    String? country,
    String? category,
    List<String>? sources,
    String? q,
    int? pageSize,
    int? page,
    String? language,
  }) {
    final request = TopHeadlinesRequest(
      country: country,
      category: category,
      sources: sources,
      q: q,
      pageSize: pageSize,
      page: page,
      language: language,
    );

    return handleNetworkCall(
      call: () => _apiClient.getTopStories(
        request.toQueryParameters(),
      ),
    );
  }

  @override
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
  }) {
    final request = EverythingNewsRequest(
      q: q,
      searchIn: searchIn,
      sources: sources,
      domains: domains,
      excludeDomains: excludeDomains,
      from: from,
      to: to,
      language: language,
      sortBy: sortBy,
      pageSize: pageSize,
      page: page,
    );

    return handleNetworkCall(
      call: () => _apiClient.getAllNews(
        request.toQueryParameters(),
      ),
    );
  }
}
