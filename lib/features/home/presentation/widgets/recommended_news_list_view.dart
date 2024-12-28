part of '../home_view.dart';

final class RecommendedNewsListView extends BaseWidget<TopNewsCubit, TopNewsState> {
  const RecommendedNewsListView({super.key});

  @override
  Widget build(
    BuildContext context,
    TopNewsCubit cubit,
    TopNewsState state,
  ) {
    if (state is TopNewsLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is TopNewsSuccess) {
      final news = state.news.data;

      if (news.isEmpty) {
        return Center(
          child: Text(
            context.l10n.saturday,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.kGrey,
            ),
          ),
        );
      }

      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: news.length,
        itemBuilder: (context, index) {
          final article = news[index];
          return RecommendedNewsCard(article: article);
        },
      );
    }

    return const SizedBox();
  }
}
