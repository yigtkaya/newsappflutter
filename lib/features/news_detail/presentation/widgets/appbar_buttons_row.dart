part of '../news_detail_view.dart';

final class AppbarButtonsRow extends StatelessWidget {
  const AppbarButtonsRow({required this.article, super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDesignConstants.spacingMedium,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: BackButton(
                  color: AppColors.kWhite,
                ),
              ),
            ),
            BookmarButtonWidget(article: article),
          ],
        ),
      ),
    );
  }
}

final class BookmarButtonWidget extends BaseWidget<BookmarksCubit, BookmarksState> {
  const BookmarButtonWidget({required this.article, super.key});

  final Article article;

  @override
  Widget build(
    BuildContext context,
    BookmarksCubit cubit,
    BookmarksState state,
  ) {
    final isBookmarked = switch (state) {
      BookmarksSuccess(bookmarkedNews: final news) => news.any(
          (element) => element.uuid == article.uuid,
        ),
      BookmarksLoading() => false,
      BookmarksInitial() => false,
      BookmarksFailure() => false,
    };

    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: IconButton(
          icon: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
            color: AppColors.kWhite,
          ),
          onPressed: () async {
            if (isBookmarked) {
              await cubit.removeFromBookmarks(article.uuid);
            } else {
              await cubit.bookmarkNews(article);
            }
          },
        ),
      ),
    );
  }
}
