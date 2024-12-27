part of 'bookmarks_cubit.dart';

sealed class BookmarksState extends BaseState {
  const BookmarksState();

  @override
  List<Object?> get props => [];
}

final class BookmarksInitial extends BookmarksState {}

final class BookmarksLoading extends BookmarksState {}

final class BookmarksSuccess extends BookmarksState {
  const BookmarksSuccess({
    required this.bookmarkedNews,
  });

  final List<Article> bookmarkedNews;

  @override
  List<Object?> get props => [bookmarkedNews];
}

final class BookmarksFailure extends BookmarksState {
  const BookmarksFailure({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}
