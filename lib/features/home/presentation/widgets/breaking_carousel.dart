part of '../home_view.dart';

final class BreakingCarouselWidget extends BaseWidget<NewsCubit, NewsState> {
  const BreakingCarouselWidget({super.key});
  @override
  Widget build(BuildContext context, NewsCubit cubit, NewsState state) {
    if (state is NewsSuccess) {
      final articles = state.news.data;
      return CarouselView.weighted(
        flexWeights: const [
          1,
          3,
          1,
        ],
        children: List<Widget>.generate(
          articles.length,
          (int index) {
            final article = articles[index];
            return BreakingNewsCard(
              article: article,
              onTap: () {},
            );
          },
        ),
      );
    } else if (state is NewsFailure) {
      return Center(
        child: Text(
          context.l10n.somethingWentWrong,
          style: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.kGrey,
          ),
        ),
      );
    } else if (state is NewsLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const SizedBox();
  }
}
