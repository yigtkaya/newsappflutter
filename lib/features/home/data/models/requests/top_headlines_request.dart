import 'package:dart_mappable/dart_mappable.dart';
import 'package:newsappflutter/core/environment/envied.dart';

part 'top_headlines_request.mapper.dart';

@MappableClass()
class TopHeadlinesRequest with TopHeadlinesRequestMappable {
  const TopHeadlinesRequest({
    this.country,
    this.category,
    this.sources,
    this.q,
    this.pageSize,
    this.page,
    this.language,
  });

  final String? country;
  final String? category;
  final List<String>? sources;
  final String? q;
  final int? pageSize;
  final int? page;
  final String? language;

  Map<String, dynamic> toQueryParameters() {
    return {
      'apiKey': DevEnv().newsApiKey,
      if (country != null) 'country': country,
      if (category != null) 'category': category,
      if (sources != null) 'sources': sources!.join(','),
      if (q != null) 'q': q,
      if (pageSize != null) 'pageSize': pageSize.toString(),
      if (page != null) 'page': page.toString(),
      if (language != null) 'language': language,
    };
  }
}
