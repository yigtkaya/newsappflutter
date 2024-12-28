part of '../home_view.dart';

final class RecommendedNewsCard extends StatelessWidget {
  const RecommendedNewsCard({
    required this.article,
    super.key,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDesignConstants.spacingMedium,
        right: AppDesignConstants.spacingMedium,
        bottom: AppDesignConstants.spacingMedium,
      ),
      child: InkWell(
        onTap: () => context.router.push(
          NewsDetailRoute(article: article),
        ),
        borderRadius: BorderRadius.circular(
          AppDesignConstants.borderRadiusMedium,
        ),
        child: Row(
          spacing: AppDesignConstants.spacingMedium,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                AppDesignConstants.borderRadiusMedium,
              ),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                width: 100.w,
                height: 100.h,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: AppColors.kGrey,
                  highlightColor: AppColors.kGreyLight1,
                  child: Container(
                    color: AppColors.kWhite,
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Icon(LucideIcons.image_off, color: AppColors.kGrey),
                ),
              ),
            ),
            Expanded(
              child: Column(
                spacing: AppDesignConstants.spacingSmall,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.general,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.kGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    article.title.toString(),
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    spacing: 4.w,
                    children: [
                      Flexible(
                        child: Text(
                          article.source?.name ?? '',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: AppColors.kGrey,
                          ),
                        ),
                      ),
                      Icon(
                        LucideIcons.badge_check,
                        color: AppColors.kDarkBlue,
                        size: 16.w,
                      ),
                      Text(
                        article.publishedAt!.formattedDateTime(),
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.kGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
