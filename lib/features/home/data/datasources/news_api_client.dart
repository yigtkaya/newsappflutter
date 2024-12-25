import 'package:dio/dio.dart';
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
  Future<NewsResponse> getTopStories(@Queries() Map<String, dynamic> queries);

  /// Get all news
  @GET('/all')
  Future<NewsResponse> getAllNews(@Queries() Map<String, dynamic> queries);

  /// Get similar news
  @GET('/similar/{uuid}')
  Future<NewsResponse> getSimilarNews({
    @Path('uuid') required String uuid,
    @Queries() required Map<String, dynamic> queries,
  });
}
