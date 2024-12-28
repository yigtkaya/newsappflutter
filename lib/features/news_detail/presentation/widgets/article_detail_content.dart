part of '../news_detail_view.dart';

final class ArticleDetailContent extends StatelessWidget {
  const ArticleDetailContent({required this.article, super.key});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableActuator(
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) {
          return Container(
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
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    spacing: AppDesignConstants.spacingMedium,
                    children: [
                      Text(
                        article.source?.name ?? '',
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
                  SizedBox(height: 16.h),
                  Text(
                    (article.content) ?? '',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
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
}
