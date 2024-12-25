part of '../home_view.dart';

final class BreakingArticlesWidget extends BaseWidget<NewsCubit, NewsState> {
  const BreakingArticlesWidget({super.key});

  @override
  Widget build(BuildContext context, NewsCubit cubit, NewsState state) {
    return SizedBox(
      height: 220.h,
      child: switch (state) {
        NewsSuccess(news: final news) => BlocProvider(
            create: (context) => DepInItems.carouselCubit,
            child: _CarouselWidget(articles: news.data),
          ),
        NewsFailure() => Center(
            child: Text(
              context.l10n.somethingWentWrong,
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.kGrey,
              ),
            ),
          ),
        NewsLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        _ => const SizedBox(),
      },
    );
  }
}

final class _CarouselWidget extends StatefulWidget {
  const _CarouselWidget({required this.articles});

  final List<Article> articles;

  @override
  State<_CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<_CarouselWidget> with _CarouselMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselCubit, double>(
      bloc: carouselCubit,
      builder: (context, state) {
        return PageView.builder(
          controller: pageController,
          itemCount: widget.articles.length,
          itemBuilder: (context, index) {
            final article = widget.articles[index];
            final scale = calculateScale(state, index);
            final rotation = calculateRotation(state, index);
            final swipingLeft = (state - index) > 0; // Calculate here instead

            return TweenAnimationBuilder(
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOutCubic,
              tween: Tween(begin: scale, end: scale),
              builder: (context, value, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(rotation)
                    ..scale(value),
                  alignment: swipingLeft ? Alignment.centerRight : Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: BreakingNewsCard(
                      article: article,
                      onTap: () => _handleArticleTap(context, article),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
