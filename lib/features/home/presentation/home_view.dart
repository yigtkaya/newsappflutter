import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/constants/app_design_constant.dart';
import 'package:newsappflutter/core/di/dependecy_injection.dart';
import 'package:newsappflutter/core/di/dependecy_injection_items.dart';
import 'package:newsappflutter/core/extensions/build_context_extension.dart';
import 'package:newsappflutter/core/extensions/date_time_extensions.dart';
import 'package:newsappflutter/core/extensions/language_extension.dart';
import 'package:newsappflutter/core/extensions/string_extension.dart';
import 'package:newsappflutter/core/view/base_view.dart';
import 'package:newsappflutter/core/view/base_widget.dart';
import 'package:newsappflutter/features/home/cubit/all_news/news_cubit.dart';
import 'package:newsappflutter/features/home/cubit/carousel_cubit.dart';
import 'package:newsappflutter/features/home/cubit/top_news/top_news_cubit.dart';
import 'package:newsappflutter/features/home/data/models/response/article_model.dart';
import 'package:shimmer/shimmer.dart';

part 'mixins/carousel_mixin.dart';
part 'widgets/breaking_carousel.dart';
part 'widgets/breaking_news_card.dart';
part 'widgets/custom_app_bar.dart';
part 'widgets/recommended_news_card.dart';
part 'widgets/recommended_news_list_view.dart';
part 'widgets/section_header.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppDesignConstants.spacingMedium,
          children: [
            SectionHeader(
              title: context.l10n.breakingNews,
            ),
            const BreakingArticlesWidget(),
            SectionHeader(
              title: context.l10n.recommendedNews,
            ),
            BlocProvider<TopNewsCubit>(
              create: (context) => DepInItems.topNewsCubit,
              child: const RecommendedNewsListView(),
            ),
          ],
        ),
      ),
    );
  }
}

// İki farklı api ile farklı haberleri gösterme
// haberlerin detay sayfası
// haberlerin kaydedilmesi ve kaydedilen haberlerin gösterilmesi.
