import 'package:dart_mappable/dart_mappable.dart';
import 'package:newsappflutter/core/environment/app_environment.dart';

part 'news_request.mapper.dart';

@MappableClass()
class NewsRequest with NewsRequestMappable {
  const NewsRequest({
    this.locale,
    this.limit,
    this.categories,
    this.search,
    this.page,
  });

  final String? locale;
  final int? limit;
  final String? categories;
  final String? search;
  final int? page;

  Map<String, dynamic> toQueryParameters() {
    return {
      if (locale != null) 'locale': locale,
      if (limit != null) 'limit': limit.toString(),
      if (categories != null) 'categories': categories,
      if (search != null) 'search': search,
      if (page != null) 'page': page.toString(),
      'api_token': AppEnvironment.newsApiKey,
    };
  }
}
