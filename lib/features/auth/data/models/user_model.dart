import 'package:dart_mappable/dart_mappable.dart';
part 'user_model.mapper.dart';

@MappableClass()

/// User model class.
final class UserModel with UserModelMappable {
  /// Constructor for UserModel.
  UserModel({
    required this.id,
    required this.email,
    required this.name,
  });

  /// Id of the user.
  final String id;

  /// Email of the user.
  final String email;

  /// Name of the user.
  final String name;
}
