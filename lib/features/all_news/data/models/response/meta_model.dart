import 'package:dart_mappable/dart_mappable.dart';

part 'meta_model.mapper.dart';

@MappableClass()
class Meta with MetaMappable {
  const Meta({
    required this.found,
    required this.returned,
    required this.limit,
    required this.page,
  });

  final int found;
  final int returned;
  final int limit;
  final int page;
}
