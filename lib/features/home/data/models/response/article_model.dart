import 'package:dart_mappable/dart_mappable.dart';
import 'package:newsappflutter/features/home/data/models/response/source_model.dart';

part 'article_model.mapper.dart';

@MappableClass()
class Article with ArticleMappable {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;
}
