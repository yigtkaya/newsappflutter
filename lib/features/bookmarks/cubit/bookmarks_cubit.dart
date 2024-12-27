import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:newsappflutter/core/cubit/base_cubit.dart';
import 'package:newsappflutter/core/network/failure.dart';
import 'package:newsappflutter/features/bookmarks/domain/usecases/add_bookmark_usecase.dart';
import 'package:newsappflutter/features/bookmarks/domain/usecases/clear_bookmarks_usecase.dart';
import 'package:newsappflutter/features/bookmarks/domain/usecases/get_bookmarked_news_usecase.dart';
import 'package:newsappflutter/features/bookmarks/domain/usecases/remove_bookmark_usecase.dart';
import 'package:newsappflutter/features/home/data/models/response/article_model.dart';

part 'bookmarks_state.dart';

final class BookmarksCubit extends BaseCubit<BookmarksState> {
  BookmarksCubit(
    this._getBookmarkedNewsUsecase,
    this._bookmarkNewsUsecase,
    this._removeFromBookmarksUsecase,
    this._clearBookmarksUsecase,
  ) : super(BookmarksInitial()) {
    getBookmarkedNews();
  }

  final GetBookmarkedNewsUsecase _getBookmarkedNewsUsecase;
  final AddBookmarkUsecase _bookmarkNewsUsecase;
  final RemoveBookmarkUsecase _removeFromBookmarksUsecase;
  final ClearBookmarksUsecase _clearBookmarksUsecase;

  Future<void> getBookmarkedNews() async {
    safeEmit(BookmarksLoading());
    final result = await _getBookmarkedNewsUsecase.call();
    result.fold(
      (failure) => safeEmit(BookmarksFailure(failure: failure)),
      (news) => safeEmit(BookmarksSuccess(bookmarkedNews: news)),
    );
  }

  Future<void> bookmarkNews(Article article) async {
    final result = await _bookmarkNewsUsecase.call(article);
    unawaited(
      result.fold(
        (failure) => safeEmit(BookmarksFailure(failure: failure)),
        (_) => getBookmarkedNews(),
      ),
    );
  }

  Future<void> removeFromBookmarks(String articleId) async {
    final result = await _removeFromBookmarksUsecase.call(articleId);
    unawaited(
      result.fold(
        (failure) => safeEmit(BookmarksFailure(failure: failure)),
        (_) => getBookmarkedNews(),
      ),
    );
  }

  Future<void> clearBookmarks() async {
    final result = await _clearBookmarksUsecase.call();
    result.fold(
      (failure) => safeEmit(BookmarksFailure(failure: failure)),
      (_) => getBookmarkedNews(),
    );
  }
}
