import 'package:dart_mappable/dart_mappable.dart';
import 'package:newsappflutter/features/home/data/models/response/article_model.dart';
import 'package:newsappflutter/features/home/data/models/response/meta_model.dart';

part 'news_response_model.mapper.dart';

@MappableClass()
class NewsResponse with NewsResponseMappable {
  const NewsResponse({
    required this.meta,
    required this.data,
  });

  final Meta meta;
  final List<Article> data;
}
