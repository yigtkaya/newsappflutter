import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/bookmarks/domain/repositories/bookmarks_repository.dart';

final class ClearBookmarksUsecase {
  ClearBookmarksUsecase(this._repository);

  final BookmarksRepository _repository;

  Future<Either<Failure, void>> call() async {
    return _repository.clearBookmarks();
  }
}
