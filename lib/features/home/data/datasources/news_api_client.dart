import 'package:dio/dio.dart';
import 'package:newsappflutter/features/home/data/models/requests/news_request.dart';
import 'package:newsappflutter/features/home/data/models/response/news_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_client.g.dart';

/// News API Client and Data Source
@RestApi()
abstract class NewsApiClient {
  /// News API Client factory
  factory NewsApiClient(Dio dio) = _NewsApiClient;

  /// Get top stories
  @GET('/top')
  Future<NewsResponse> getTopStories(NewsRequest request);

  /// Get all news
  @GET('/all')
  Future<NewsResponse> getAllNews(NewsRequest request);

  /// Get similar news
  @GET('/similar/{uuid}')
  Future<NewsResponse> getSimilarNews({
    @Path('uuid') required String uuid,
    required NewsRequest request,
  });
}
