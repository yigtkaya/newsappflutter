part of 'root_view.dart';

mixin RootViewMixin on State<RootView> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onIndexChanged(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    context.read<BottomNavigationCubit>().onIndexChanged(index);
  }
}
