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
  @GET('/top-headlines')
  Future<NewsResponse> getTopStories(Map<String, dynamic> request);

  /// Get all news
  @GET('/everything')
  Future<NewsResponse> getAllNews(Map<String, dynamic> request);
}
