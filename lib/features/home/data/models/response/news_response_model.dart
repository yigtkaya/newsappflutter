import 'package:dart_mappable/dart_mappable.dart';
import 'package:newsappflutter/features/home/data/models/response/article_model.dart';

part 'news_response_model.mapper.dart';

@MappableClass()
class NewsResponse with NewsResponseMappable {
  NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<Article>? articles;
}
