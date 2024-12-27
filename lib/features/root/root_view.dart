import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappflutter/core/widgets/custom_bottom_nav_bar.dart';
import 'package:newsappflutter/features/bookmarks/presentation/bookmarks_view.dart';
import 'package:newsappflutter/features/home/presentation/home_view.dart';
import 'package:newsappflutter/features/root/bottom_navigation_cubit.dart';

part 'root_view_mixin.dart';

@RoutePage()
final class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> with RootViewMixin {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentIndex: context.watch<BottomNavigationCubit>().state,
      onIndexChanged: _onIndexChanged,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeView(),
          BookmarksView(),
        ],
      ),
    );
  }
}

final class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    required this.body,
    this.appBar,
    this.currentIndex = 0,
    this.onIndexChanged,
    super.key,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final int currentIndex;
  final void Function(int)? onIndexChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: onIndexChanged ?? (_) {},
      ),
    );
  }
}
