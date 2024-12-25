import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/constants/app_design_constant.dart';
import 'package:newsappflutter/core/di/dependecy_injection.dart';
import 'package:newsappflutter/core/extensions/build_context_extension.dart';
import 'package:newsappflutter/core/view/base_view.dart';
import 'package:newsappflutter/core/view/base_widget.dart';
import 'package:newsappflutter/features/home/cubit/news_cubit.dart';
import 'package:newsappflutter/features/home/data/models/response/article_model.dart';
import 'package:newsappflutter/localization/cubit/language_cubit.dart';
import 'package:shimmer/shimmer.dart';

part 'widgets/section_header.dart';
part 'widgets/custom_app_bar.dart';
part 'widgets/breaking_carousel.dart';
part 'widgets/breaking_news_card.dart';

@RoutePage()
final class HomeView extends BaseView<NewsCubit, NewsState> {
  const HomeView({
    super.key,
  }) : super(
          cubit: DependencyInjection.read<NewsCubit>,
        );

  @override
  Widget builder(BuildContext context, NewsCubit cubit) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDesignConstants.spacingMedium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              title: context.l10n.breakingNews,
              actionText: context.l10n.seeAll,
            ),
            const BreakingCarouselWidget(),
          ],
        ),
      ),
    );
  }
}