import 'package:newsappflutter/core/cache/core/cache_model.dart';
import 'package:newsappflutter/features/auth/data/models/user_model.dart';

/// User entity class.
final class UserEntity with CacheModel {
  /// Constructor for UserEntity.
  UserEntity({
    required this.user,
  });

  /// Empty constructor for UserEntity.
  UserEntity.empty() : user = UserModel(id: '', email: '', name: '');

  /// User model.
  final UserModel user;

  @override
  Map<String, dynamic> toJson() {
    return user.toMap();
  }

  @override
  CacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>;

    if (jsonMap.isEmpty) {
      return this;
    }

    return copyWith(
      user: UserModelMapper.fromMap(
        jsonMap,
      ),
    );
  }

  /// Copy with method for UserEntity.
  UserEntity copyWith({
    UserModel? user,
  }) {
    return UserEntity(
      user: user ?? this.user,
    );
  }

  @override
  String get id => user.id;
}
