import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:newsappflutter/core/widgets/custom_bottom_nav_bar.dart';
import 'package:newsappflutter/features/home/presentation/home_view.dart';

@RoutePage()
class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _currentIndex = 0;
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onIndexChanged(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentIndex: _currentIndex,
      onIndexChanged: _onIndexChanged,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeView(),
          HomeView(),
          HomeView(),
          HomeView(),
        ],
      ),
    );
  }
}

class BaseScaffold extends StatefulWidget {
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
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: widget.currentIndex,
        onTap: widget.onIndexChanged ?? (_) {},
      ),
    );
  }
}
