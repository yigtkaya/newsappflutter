import 'package:dart_mappable/dart_mappable.dart';

part 'source_model.mapper.dart';

@MappableClass()
class Source with SourceMappable {
  Source({
    this.id,
    this.name,
  });
  String? id;
  String? name;
}
