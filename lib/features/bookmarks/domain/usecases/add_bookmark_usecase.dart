import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/bookmarks/domain/repositories/bookmarks_repository.dart';
import 'package:newsappflutter/features/home/data/models/response/article_model.dart';

final class AddBookmarkUsecase {
  AddBookmarkUsecase(this._repository);

  final BookmarksRepository _repository;

  Future<Future<Either<Failure, void>>> call(Article article) async {
    return _repository.bookmarkNews(article);
  }
}
