import 'package:dart_mappable/dart_mappable.dart';
import 'package:newsappflutter/core/environment/envied.dart';

part 'everything_news_request.mapper.dart';

@MappableClass()
class EverythingNewsRequest with EverythingNewsRequestMappable {
  const EverythingNewsRequest({
    this.q,
    this.searchIn,
    this.sources,
    this.domains,
    this.excludeDomains,
    this.from,
    this.to,
    this.language,
    this.sortBy,
    this.pageSize,
    this.page,
  });

  final String? q;
  final List<String>? searchIn;
  final List<String>? sources;
  final List<String>? domains;
  final List<String>? excludeDomains;
  final DateTime? from;
  final DateTime? to;
  final String? language;
  final String? sortBy;
  final int? pageSize;
  final int? page;

  Map<String, dynamic> toQueryParameters() {
    return {
      'apiKey': DevEnv().newsApiKey,
      if (q != null) 'q': q,
      if (searchIn != null) 'searchIn': searchIn!.join(','),
      if (sources != null) 'sources': sources!.join(','),
      if (domains != null) 'domains': domains!.join(','),
      if (excludeDomains != null) 'excludeDomains': excludeDomains!.join(','),
      if (from != null) 'from': from!.toIso8601String(),
      if (to != null) 'to': to!.toIso8601String(),
      if (language != null) 'language': language,
      if (sortBy != null) 'sortBy': sortBy,
      if (pageSize != null) 'pageSize': pageSize.toString(),
      if (page != null) 'page': page.toString(),
    };
  }
}
