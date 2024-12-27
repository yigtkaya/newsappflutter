import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/bookmarks/domain/repositories/bookmarks_repository.dart';

final class RemoveBookmarkUsecase {
  RemoveBookmarkUsecase(this._repository);

  final BookmarksRepository _repository;

  Future<Future<Either<Failure, void>>> call(String articleId) async {
    return _repository.removeFromBookmarks(articleId);
  }
}
