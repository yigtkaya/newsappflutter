part of '../bookmarks_view.dart';

final class BookmarksContent extends BaseWidget<BookmarksCubit, BookmarksState> {
  const BookmarksContent({super.key});

  @override
  Widget build(
    BuildContext context,
    BookmarksCubit cubit,
    BookmarksState state,
  ) {
    return BlocListener<BookmarksCubit, BookmarksState>(
      listener: (context, state) {
        if (state is BookmarksFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.failure.message)),
          );
        }
      },
      child: _buildContent(context, cubit, state),
    );
  }

  Widget _buildContent(
    BuildContext context,
    BookmarksCubit cubit,
    BookmarksState state,
  ) {
    if (state is BookmarksLoading || state is BookmarksInitial) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is BookmarksFailure) {
      return Center(
        child: Text(
          state.failure.message,
          style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.kGrey,
          ),
        ),
      );
    }

    if (state is BookmarksSuccess) {
      if (state.bookmarkedNews.isEmpty) {
        return Center(
          child: Text(
            context.l10n.noBookmarks,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.kGrey,
            ),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: AppDesignConstants.spacingSmall,
        ),
        itemCount: state.bookmarkedNews.length,
        itemBuilder: (context, index) {
          final article = state.bookmarkedNews[index];
          return Dismissible(
            key: Key(article.title.toString()),
            onDismissed: (_) {
              cubit.removeFromBookmarks(article.title.toString());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Article removed from bookmarks'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () => cubit.bookmarkNews(article),
                  ),
                ),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: RecommendedNewsCard(
              article: article,
            ),
          );
        },
      );
    }

    return const SizedBox();
  }
}
