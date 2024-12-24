import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:newsappflutter/features/auth/presentation/forgot_password_view.dart';
import 'package:newsappflutter/features/auth/presentation/login_view.dart';
import 'package:newsappflutter/features/auth/presentation/sign_up_view.dart';
import 'package:newsappflutter/features/onboarding/onboarding_view.dart';
import 'package:newsappflutter/features/root/home_view.dart';
import 'package:newsappflutter/features/splash/splash_view.dart';

part 'app_router.gr.dart';

/// Root navigator key for the app.
final rootNavigatorKey = GlobalKey<NavigatorState>();

/// AppRouter is the main router of the app.
@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  /// Constructor for AppRouter.
  AppRouter() : super(navigatorKey: rootNavigatorKey);

  /// Default route type for the app.
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: SignUpRoute.page,
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
        ),
// CustomRoute(
//           page: RootRoute.page,
//           transitionsBuilder: TransitionsBuilders.fadeIn,
//           children: [
//             AutoRoute(page: LandingPageRoute.page),
//             AutoRoute(page: ShareTripRoute.page),
//             AutoRoute(
//               page: ChatRoomRoute.page,
//               children: [
//                 AutoRoute(
//                   page: MessagesRoute.page,
//                 ),
//               ],
//             ),
//             AutoRoute(page: MyTripsRoute.page),
//             AutoRoute(
//               page: ProfileRoute.page,
//               children: [
//                 AutoRoute(
//                   page: EditProfileRoute.page,
//                 ),
//               ],
//             ),
//           ],
//         ),
      ];
}
