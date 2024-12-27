import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/constants/app_design_constant.dart';
import 'package:newsappflutter/core/di/dependecy_injection.dart';
import 'package:newsappflutter/core/extensions/build_context_extension.dart';
import 'package:newsappflutter/core/extensions/date_time_extensions.dart';
import 'package:newsappflutter/core/extensions/string_extension.dart';
import 'package:newsappflutter/core/view/base_view.dart';
import 'package:newsappflutter/core/view/base_widget.dart';
import 'package:newsappflutter/features/bookmarks/cubit/bookmarks_cubit.dart';
import 'package:newsappflutter/features/home/data/models/response/article_model.dart';
import 'package:shimmer/shimmer.dart';

part 'widgets/appbar_buttons_row.dart';
part 'widgets/article_image.dart';
part 'widgets/article_detail_content.dart';

@RoutePage()
final class NewsDetailView extends BaseView<BookmarksCubit, BookmarksState> {
  const NewsDetailView({required this.article, super.key})
      : super(
          cubit: DependencyInjection.read<BookmarksCubit>,
        );

  final Article article;

  @override
  Widget builder(BuildContext context, BookmarksCubit cubit) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Hero animated image at the top
            ArticleImage(article: article),

            // Floating app bar with back and bookmark buttons
            AppbarButtonsRow(
              article: article,
            ),

            // Draggable bottom sheet with article content
            ArticleDetailContent(
              article: article,
            ),
          ],
        ),
      ),
    );
  }
}
