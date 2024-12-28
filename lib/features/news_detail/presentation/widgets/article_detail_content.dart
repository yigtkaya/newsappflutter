part of '../news_detail_view.dart';

final class ArticleDetailContent extends StatefulWidget {
  const ArticleDetailContent({required this.article, super.key});

  final Article article;

  @override
  State<ArticleDetailContent> createState() => _ArticleDetailContentState();
}

class _ArticleDetailContentState extends State<ArticleDetailContent> {
  final ValueNotifier<double> scrollPosition = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableActuator(
      child: DraggableScrollableSheet(
        minChildSize: 0.5,
        builder: (context, scrollController) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                scrollPosition.value = notification.metrics.pixels;
              }
              return false;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDesignConstants.spacingMedium,
              ),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(
                    AppDesignConstants.borderRadiusLarge,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(10),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: AppDesignConstants.spacingMedium,
                      children: [
                        SizedBox(height: 20.h),
                        // Category and metadata row
                        Row(
                          children: [
                            // Category chip
                            if (widget.article.categories.isNotEmpty)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppDesignConstants.spacingMedium,
                                  vertical: AppDesignConstants.spacingSmall,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.kDarkBlue.withAlpha(10),
                                  borderRadius: BorderRadius.circular(
                                    AppDesignConstants.borderRadiusMedium,
                                  ),
                                ),
                                child: Text(
                                  widget.article.categories.first.capitalizeFirstLetter(),
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: AppColors.kDarkBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            const Spacer(),
                            // Time ago
                            Text(
                              widget.article.publishedAt.formattedDateTime(),
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.kGrey,
                              ),
                            ),
                          ],
                        ),
                        ValueListenableBuilder<double>(
                          valueListenable: scrollPosition,
                          builder: (context, position, child) {
                            return AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: position > 100 ? 1.0 : 0.0,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: position > 100 ? null : 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: AppDesignConstants.spacingMedium,
                                  ),
                                  child: Text(
                                    widget.article.title,
                                    style: context.textTheme.titleSmall,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        // Source with verification
                        Row(
                          spacing: AppDesignConstants.spacingMedium,
                          children: [
                            Text(
                              widget.article.source,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.kGrey,
                              ),
                            ),
                            Icon(
                              LucideIcons.badge_check,
                              color: AppColors.kDarkBlue,
                              size: 16.r,
                            ),
                          ],
                        ),
                        // Article content
                        Text(
                          widget.article.description * 5,
                          style: context.textTheme.bodyMedium?.copyWith(
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    scrollPosition.dispose();
    super.dispose();
  }
}
