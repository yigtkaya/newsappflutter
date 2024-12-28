part of '../news_detail_view.dart';

final class ArticleImage extends StatelessWidget {
  const ArticleImage({
    required this.article,
    super.key,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: context.screenHeight * 0.6,
          child: Hero(
            tag: 'article_image_${article.title}',
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? '',
              fit: BoxFit.cover,
              memCacheHeight: (context.screenHeight * 0.6).round(), // Set appropriate height for memory cache
              memCacheWidth: context.screenWidth.round(), // Set appropriate width for memory cache
              maxWidthDiskCache: 2048, // Set maximum width for disk cache
              maxHeightDiskCache: 2048, // Set maximum height for disk cache
              fadeInDuration: const Duration(milliseconds: 300),
              fadeOutDuration: const Duration(milliseconds: 300),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: AppColors.kGrey,
                highlightColor: AppColors.kGreyLight1,
                child: Container(
                  color: AppColors.kWhite,
                ),
              ),
              errorWidget: (context, url, error) => ColoredBox(
                color: AppColors.kGreyLight1,
                child: Icon(
                  LucideIcons.image_off,
                  color: AppColors.kGrey,
                  size: 32,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 120,
          right: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppDesignConstants.spacingMedium,
            children: [
              Text(
                article.title.toString(),
                textAlign: TextAlign.start,
                style: context.textTheme.titleSmall!.copyWith(
                  color: AppColors.kWhite,
                ),
              ),
              Row(
                spacing: AppDesignConstants.spacingMedium,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDesignConstants.spacingSmall,
                      vertical: AppDesignConstants.spacingSmall,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.kDarkBlue,
                      borderRadius: BorderRadius.circular(
                        AppDesignConstants.borderRadiusLarge,
                      ),
                    ),
                    child: Text(
                      context.l10n.general,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.circle,
                    size: 6,
                    color: AppColors.kWhite,
                  ),
                  Text(
                    article.publishedAt!.formattedDateTime(),
                    textAlign: TextAlign.start,
                    style: context.textTheme.bodyLarge!.copyWith(
                      color: AppColors.kWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
