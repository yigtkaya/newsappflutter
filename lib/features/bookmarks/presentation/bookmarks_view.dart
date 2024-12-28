import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappflutter/core/constants/app_colors.dart';
import 'package:newsappflutter/core/constants/app_design_constant.dart';
import 'package:newsappflutter/core/di/dependecy_injection.dart';
import 'package:newsappflutter/core/extensions/build_context_extension.dart';
import 'package:newsappflutter/core/extensions/language_extension.dart';
import 'package:newsappflutter/core/view/base_view.dart';
import 'package:newsappflutter/core/view/base_widget.dart';
import 'package:newsappflutter/features/bookmarks/cubit/bookmarks_cubit.dart';
import 'package:newsappflutter/features/home/presentation/home_view.dart';

part 'widgets/bookmarks_content.dart';

@RoutePage()
final class BookmarksView extends BaseView<BookmarksCubit, BookmarksState> {
  const BookmarksView({super.key})
      : super(
          value: DependencyInjection.read<BookmarksCubit>,
        );

  @override
  Widget builder(BuildContext context, BookmarksCubit cubit) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.bookmarks,
          style: context.textTheme.titleMedium,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: AppDesignConstants.spacingMedium,
            ),
            child: GestureDetector(
              onTap: () => context.read<BookmarksCubit>().clearBookmarks(),
              child: Text(
                context.l10n.clearAll,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.kGrey,
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
        backgroundColor: AppColors.kWhite,
        elevation: 0,
      ),
      body: const BookmarksContent(),
    );
  }
}
